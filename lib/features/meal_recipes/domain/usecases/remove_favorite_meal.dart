import 'package:meal_explorer/features/meal_recipes/domain/repositories/meal_repository.dart';

abstract class RemoveFavoriteMeal {
  Future<void> call(String id);
}

class RemoveFavoriteMealImpl implements RemoveFavoriteMeal {
  final MealRepository repository;

  RemoveFavoriteMealImpl(this.repository);

  @override
  Future<void> call(String id) async {
    return await repository.removeFavoriteMealById(id);
  }
}
