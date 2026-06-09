import 'package:dartz/dartz.dart';
import 'package:meal_explorer/features/meal_recipes/domain/entities/meal_detail.dart';
import 'package:meal_explorer/features/meal_recipes/domain/failures.dart';
import 'package:meal_explorer/features/meal_recipes/domain/repositories/meal_repository.dart';

abstract class SearchMeal {
  Future<Either<Failure, List<MealDetail>>> call(String name);
}

class SearchMealImpl implements SearchMeal {
  final MealRepository repository;

  SearchMealImpl(this.repository);

  @override
  Future<Either<Failure, List<MealDetail>>> call(String name) async {
    return await repository.searchMealByName(name);
  }
}
