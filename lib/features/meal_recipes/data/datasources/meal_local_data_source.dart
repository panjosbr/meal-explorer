import 'dart:convert';

import 'package:meal_explorer/features/meal_recipes/data/models/meal_detail_model.dart';
import 'package:meal_explorer/features/meal_recipes/domain/entities/meal_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String savedFavorites = 'SAVED_FAVORITES';

abstract class MealLocalDataSource {
  Future<List<MealDetail>> getFavoritesMeals();
  Future<void> saveFavoriteMeals(MealDetail meal);
  Future<void> removeFavoriteMeal(String id);
}

class MealLocalDataSourceImpl implements MealLocalDataSource {
  final SharedPreferences sharedPreferences;

  MealLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<MealDetail>> getFavoritesMeals() async {
    try {
      final List<String>? currentFavorites = sharedPreferences.getStringList(
        savedFavorites,
      );

      if (currentFavorites == null || currentFavorites.isEmpty) {
        return [];
      }

      return currentFavorites.map((jsonString) {
        final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
        return MealDetailModel.fromLocalJson(jsonMap);
      }).toList();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> removeFavoriteMeal(String id) async {
    try {
      final List<String> currentFavorites =
          sharedPreferences.getStringList(savedFavorites) ?? [];

      final updatedFavorites = currentFavorites.where((favJson) {
        final Map<String, dynamic> favMap = jsonDecode(favJson);
        return favMap['idMeal'] != id;
      }).toList();

      await sharedPreferences.setStringList(savedFavorites, updatedFavorites);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> saveFavoriteMeals(MealDetail meal) async {
    try {
      final List<String> currentFavorites =
          sharedPreferences.getStringList(savedFavorites) ?? [];
      final mealJsonEncoded = jsonEncode((meal as MealDetailModel).toJson());
      final bool alreadySaved = currentFavorites.any(
        ((element) =>
            MealDetailModel.fromLocalJson(jsonDecode(element)).id == meal.id),
      );

      if (!alreadySaved) {
        currentFavorites.add(mealJsonEncoded);
        await sharedPreferences.setStringList(savedFavorites, currentFavorites);
      }
    } catch (_) {
      rethrow;
    }
  }
}
