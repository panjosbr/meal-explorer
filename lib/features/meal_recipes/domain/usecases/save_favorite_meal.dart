import 'package:meal_explorer/features/meal_recipes/domain/entities/meal_detail.dart';
import 'package:meal_explorer/features/meal_recipes/domain/repositories/meal_repository.dart';

abstract class SaveFavoriteMeal {
  Future<void> call(MealDetail meal);
}

class SaveFavoriteMealImpl implements SaveFavoriteMeal {
  final MealRepository repository;

  SaveFavoriteMealImpl(this.repository);

  @override
  Future<void> call(MealDetail meal) async {
    return await repository.saveFavoriteMeal(meal);
  }
}
