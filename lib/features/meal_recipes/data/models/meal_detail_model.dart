import 'package:meal_explorer/features/meal_recipes/data/models/ingredient_model.dart';
import 'package:meal_explorer/features/meal_recipes/domain/entities/ingredient.dart';
import 'package:meal_explorer/features/meal_recipes/domain/entities/meal_detail.dart';

class MealDetailModel extends MealDetail {
  const MealDetailModel({
    required super.id,
    required super.imageUrl,
    required super.ingredients,
    required super.instructions,
    required super.name,
  });

  static List<MealDetailModel> fromRemoteJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => MealDetailModel.fromRemoteJson(json))
        .toList();
  }

  factory MealDetailModel.fromRemoteJson(Map<String, dynamic> json) {
    final List<Ingredient> ingredientModel = extractIngredients(json);
    return MealDetailModel(
      id: json['idMeal'],
      name: json['strMeal'],
      imageUrl: json['strMealThumb'],
      ingredients: ingredientModel,
      instructions: json['strInstructions'],
    );
  }

  factory MealDetailModel.fromLocalJson(Map<String, dynamic> json) {
    List<dynamic> ingredients = json['ingredients'];
    final List<Ingredient> ingredientModels = ingredients
        .map((e) => Ingredient(name: e['name'], measure: e['measure']))
        .toList();

    return MealDetailModel(
      id: json['idMeal'],
      name: json['strMeal'],
      imageUrl: json['strMealThumb'],
      ingredients: ingredientModels,
      instructions: json['strInstructions'],
    );
  }

  static List<Ingredient> extractIngredients(Map<String, dynamic> json) {
    final List<Ingredient> result = [];

    for (int i = 1; i <= 20; i++) {
      final ingredientName = json['strIngredient$i'] as String?;
      final measure = json['strMeasure$i'] as String?;

      if (ingredientName != null && ingredientName.trim().isNotEmpty) {
        result.add(
          Ingredient(name: ingredientName, measure: measure?.trim() ?? ''),
        );
      }
    }

    return result;
  }

  Map<String, dynamic> toJson() {
    return {
      'idMeal': id,
      'streMeal': name,
      'strMealThumb': imageUrl,
      'strInstructions': instructions,
      'ingredients': ingredients
          .map((e) => (e as IngredientModel).toJson())
          .toList(),
    };
  }
}
