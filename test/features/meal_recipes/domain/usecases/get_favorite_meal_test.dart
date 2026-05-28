import 'package:flutter_test/flutter_test.dart';
import 'package:meal_explorer/features/meal_recipes/domain/repositories/meal_repository.dart';
import 'package:meal_explorer/features/meal_recipes/domain/usecases/get_favorite_meal.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

class MockMealRepository extends Mock implements MealRepository {}

void main() {
  late GetFavoriteMeals usecase;
  late MockMealRepository mockRepository;

  setUp(() {
    mockRepository = MockMealRepository();
    usecase = GetFavoriteMealsImpl(mockRepository);
  });

  group('GetFavoriteMeals', () {
    test(
      'Must call mockRepository.getFavoriteMEals and return List<MealDetail> when success',
      () async {
        when(
          () => mockRepository.getFavoriteMeals(),
        ).thenAnswer((_) async => tListMealDetail);

        final result = await usecase();
        expect(result, tListMealDetail);
        verify(() => mockRepository.getFavoriteMeals()).called(1);
      },
    );
  });
}
