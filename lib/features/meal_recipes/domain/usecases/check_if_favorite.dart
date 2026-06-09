import 'package:dartz/dartz.dart';
import 'package:meal_explorer/features/meal_recipes/domain/failures.dart';
import 'package:meal_explorer/features/meal_recipes/domain/repositories/meal_repository.dart';

abstract class CheckIfFavorite {
  Future<Either<Failure, bool>> call(String id);
}

class CheckIfFavoriteImpl implements CheckIfFavorite {
  final MealRepository repository;

  const CheckIfFavoriteImpl({required this.repository});

  @override
  Future<Either<Failure, bool>> call(String id) async {
    final result = await repository.getFavoriteMeals();

    return result.fold((failure) => Left(failure), (favorites) {
      bool isFavorite = favorites.any((meal) => meal.id == id);
      return Right(isFavorite);
    });
  }
}
