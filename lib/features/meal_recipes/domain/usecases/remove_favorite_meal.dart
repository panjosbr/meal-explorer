import 'package:dartz/dartz.dart';
import 'package:meal_explorer/features/meal_recipes/domain/failures.dart';
import 'package:meal_explorer/features/meal_recipes/domain/repositories/meal_repository.dart';

abstract class RemoveFavoriteMeal {
  Future<Either<Failure, Unit>> call(String id);
}

class RemoveFavoriteMealImpl implements RemoveFavoriteMeal {
  final MealRepository repository;

  RemoveFavoriteMealImpl(this.repository);

  @override
  Future<Either<Failure, Unit>> call(String id) async {
    return await repository.removeFavoriteMealById(id);
  }
}
