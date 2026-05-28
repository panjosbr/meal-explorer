import 'package:equatable/equatable.dart';
import 'package:meal_explorer/features/meal_recipes/domain/entities/ingredient.dart';

class MealDetail extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final String instructions;
  final List<Ingredient> ingredients;

  const MealDetail({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.instructions,
    required this.ingredients,
  });

  @override
  List<Object?> get props => [id, name, imageUrl, instructions, ingredients];
}
