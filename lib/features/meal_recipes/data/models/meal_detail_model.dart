import 'package:meal_explorer/features/meal_recipes/data/models/ingredient_model.dart';
import 'package:meal_explorer/features/meal_recipes/domain/entities/meal_detail.dart';

class MealDetailModel extends MealDetail {
  const MealDetailModel({
    required super.id,
    required super.imageUrl,
    required super.ingredients,
    required super.instructions,
    required super.name,
  });

  factory MealDetailModel.fromRemoteJson(Map<String, dynamic> json) {
    final List<IngredientModel> ingredientModel = extractIngredients(json);
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
    final List<IngredientModel> ingredientModels = ingredients
        .map(
          (e) =>
              IngredientModel.fromParam(name: e['name'], measure: e['measure']),
        )
        .toList();

    return MealDetailModel(
      id: json['idMeal'],
      name: json['strMeal'],
      imageUrl: json['strMealThumb'],
      ingredients: ingredientModels,
      instructions: json['strInstructions'],
    );
  }

  static List<IngredientModel> extractIngredients(Map<String, dynamic> json) {
    final List<IngredientModel> result = [];

    for (int i = 1; i <= 20; i++) {
      final ingredientName = json['strIngredient$i'] as String?;
      final measure = json['strMeasure$i'] as String?;

      if (ingredientName != null && ingredientName.trim().isNotEmpty) {
        result.add(
          IngredientModel(name: ingredientName, measure: measure?.trim() ?? ''),
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
