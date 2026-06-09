import 'package:dartz/dartz.dart';
import 'package:meal_explorer/features/meal_recipes/domain/entities/meal_detail.dart';
import 'package:meal_explorer/features/meal_recipes/domain/failures.dart';
import 'package:meal_explorer/features/meal_recipes/domain/repositories/meal_repository.dart';

abstract class SaveFavoriteMeal {
  Future<Either<Failure, Unit>> call(MealDetail meal);
}

class SaveFavoriteMealImpl implements SaveFavoriteMeal {
  final MealRepository repository;

  SaveFavoriteMealImpl(this.repository);

  @override
  Future<Either<Failure, Unit>> call(MealDetail meal) async {
    return await repository.saveFavoriteMeal(meal);
  }
}
