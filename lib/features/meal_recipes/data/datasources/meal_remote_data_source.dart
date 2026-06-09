import 'dart:convert';

import 'package:meal_explorer/features/meal_recipes/data/exceptions.dart';
import 'package:meal_explorer/features/meal_recipes/data/models/meal_detail_model.dart';
import 'package:meal_explorer/features/meal_recipes/domain/entities/meal_detail.dart';
import 'package:http/http.dart' as http;

abstract class MealRemoteDataSource {
  Future<List<MealDetail>> searchMealsByName(String name);
  Future<MealDetail> getMealDetailsById(String id);
  Future<MealDetail> getRandomMeal();
}

class MealRemoteDataSourceImpl implements MealRemoteDataSource {
  final http.Client client;
  final String baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  MealRemoteDataSourceImpl({required this.client});

  @override
  Future<MealDetail> getMealDetailsById(String id) async {
    final uri = Uri.parse('$baseUrl/lookup.php?i=$id');

    try {
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        final jsonMap = jsonDecode(response.body) as Map<String, dynamic>;
        final mealsList = jsonMap['meals'] as List<dynamic>?;

        if (mealsList == null || mealsList.isEmpty) {
          throw NotFoundException();
        }

        return MealDetailModel.fromRemoteJson(
          mealsList.first as Map<String, dynamic>,
        );
      }

      throw ServerException(
        'Erro interno do servidor. Status ${response.statusCode}',
      );
    } catch (e) {
      if (e is NotFoundException || e is ServerException) rethrow;
      throw InternalException('$e');
    }
  }

  @override
  Future<MealDetail> getRandomMeal() async {
    final uri = Uri.parse('$baseUrl/random.php');

    try {
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        final jsonMap = jsonDecode(response.body) as Map<String, dynamic>;
        final mealsList = jsonMap['meals'] as List<dynamic>?;

        if (mealsList == null || mealsList.isEmpty) {
          throw NotFoundException();
        }

        return MealDetailModel.fromRemoteJson(
          mealsList.first as Map<String, dynamic>,
        );
      }

      throw ServerException(
        'Erro interno do servidor. Status ${response.statusCode}',
      );
    } catch (e) {
      if (e is NotFoundException || e is ServerException) rethrow;
      throw InternalException('$e');
    }
  }

  @override
  Future<List<MealDetail>> searchMealsByName(String name) async {
    final uri = Uri.parse('$baseUrl/search.php?s=$name');

    try {
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        final jsonMap = jsonDecode(response.body) as Map<String, dynamic>;
        final mealsList = jsonMap['meals'] as List<dynamic>?;

        if (mealsList == null || mealsList.isEmpty) {
          throw NotFoundException();
        }

        return MealDetailModel.fromRemoteJsonList(mealsList);
      }

      throw ServerException(
        'Erro interno do servidor. Status ${response.statusCode}',
      );
    } catch (e) {
      if (e is NotFoundException || e is ServerException) rethrow;
      throw InternalException('$e');
    }
  }
}
