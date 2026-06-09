import 'package:dartz/dartz.dart';
import 'package:meal_explorer/features/meal_recipes/domain/entities/meal_detail.dart';
import 'package:meal_explorer/features/meal_recipes/domain/failures.dart';
import 'package:meal_explorer/features/meal_recipes/domain/repositories/meal_repository.dart';

abstract class GetMealDetails {
  Future<Either<Failure, MealDetail>> call(String id);
}

class GetMealDetailsImpl implements GetMealDetails {
  final MealRepository repository;

  GetMealDetailsImpl(this.repository);

  @override
  Future<Either<Failure, MealDetail>> call(String id) async {
    return await repository.getMealDetailsById(id);
  }
}
