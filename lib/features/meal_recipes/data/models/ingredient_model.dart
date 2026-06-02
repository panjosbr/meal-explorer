import 'package:meal_explorer/features/meal_recipes/domain/entities/ingredient.dart';

class IngredientModel extends Ingredient {
  const IngredientModel({required super.name, required super.measure});

  factory IngredientModel.fromParam({
    required String name,
    required String measure,
  }) {
    return IngredientModel(name: name, measure: measure);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'measure': measure};
  }
}
