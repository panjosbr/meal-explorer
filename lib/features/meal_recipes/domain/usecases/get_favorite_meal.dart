import 'package:dartz/dartz.dart';
import 'package:meal_explorer/features/meal_recipes/domain/entities/meal_detail.dart';
import 'package:meal_explorer/features/meal_recipes/domain/failures.dart';
import 'package:meal_explorer/features/meal_recipes/domain/repositories/meal_repository.dart';

abstract class GetFavoriteMeals {
  Future<Either<Failure, List<MealDetail>>> call();
}

class GetFavoriteMealsImpl implements GetFavoriteMeals {
  final MealRepository repository;

  GetFavoriteMealsImpl(this.repository);

  @override
  Future<Either<Failure, List<MealDetail>>> call() async {
    return await repository.getFavoriteMeals();
  }
}
