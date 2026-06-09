import 'package:meal_explorer/features/meal_recipes/domain/entities/ingredient.dart';

class IngredientModel extends Ingredient {
  const IngredientModel({required super.name, required super.measure});

  Map<String, dynamic> toJson() {
    return {'name': name, 'measure': measure};
  }
}
