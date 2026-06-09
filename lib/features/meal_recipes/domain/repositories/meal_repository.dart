import 'package:dartz/dartz.dart';
import 'package:meal_explorer/features/meal_recipes/domain/entities/meal_detail.dart';
import 'package:meal_explorer/features/meal_recipes/domain/failures.dart';

abstract class MealRepository {
  Future<Either<Failure, List<MealDetail>>> searchMealByName(String name);
  Future<Either<Failure, MealDetail>> getMealDetailsById(String id);
  Future<Either<Failure, Unit>> saveFavoriteMeal(MealDetail meal);
  Future<Either<Failure, Unit>> removeFavoriteMealById(String id);
  Future<Either<Failure, List<MealDetail>>> getFavoriteMeals();
  Future<Either<Failure, MealDetail>> getRandomMeal();
}
