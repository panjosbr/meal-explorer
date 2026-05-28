import 'package:flutter_test/flutter_test.dart';
import 'package:meal_explorer/features/meal_recipes/domain/repositories/meal_repository.dart';
import 'package:meal_explorer/features/meal_recipes/domain/usecases/remove_favorite_meal.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

class MockMealRepository extends Mock implements MealRepository {}

void main() {
  late MockMealRepository mockRepository;
  late RemoveFavoriteMeal usecase;

  setUp(() {
    mockRepository = MockMealRepository();
    usecase = RemoveFavoriteMealImpl(mockRepository);
  });

  group('RemoveFavoriteMeal', () {
    test(
      'Must call mockRepository.removeFavoriteMealById and return void when success',
      () async {
        when(
          () => mockRepository.removeFavoriteMealById(any()),
        ).thenAnswer((_) async {});
        await usecase(tIdExample);
        verify(
          () => mockRepository.removeFavoriteMealById(tIdExample),
        ).called(1);
      },
    );
  });
}
