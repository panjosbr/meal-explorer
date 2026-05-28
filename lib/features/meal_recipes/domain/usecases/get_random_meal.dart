import 'package:meal_explorer/features/meal_recipes/domain/entities/meal_detail.dart';
import 'package:meal_explorer/features/meal_recipes/domain/repositories/meal_repository.dart';

abstract class GetRandomMeal {
  Future<MealDetail> call();
}

class GetRandomMealImpl implements GetRandomMeal {
  final MealRepository repository;

  GetRandomMealImpl(this.repository);

  @override
  Future<MealDetail> call() async {
    return await repository.getRandomMeal();
  }
}
