import 'package:meal_explorer/features/meal_recipes/domain/entities/meal_detail.dart';

abstract class MealRepository {
  Future<List<MealDetail>> searchMealByName(String name);
  Future<MealDetail> getMealDetailsById(String id);
  Future<void> saveFavoriteMeal(MealDetail meal);
  Future<void> removeFavoriteMealById(String id);
  Future<List<MealDetail>> getFavoriteMeals();
  Future<MealDetail> getRandomMeal();
}
