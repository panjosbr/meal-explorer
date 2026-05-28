import 'package:flutter_test/flutter_test.dart';
import 'package:meal_explorer/features/meal_recipes/domain/repositories/meal_repository.dart';
import 'package:meal_explorer/features/meal_recipes/domain/usecases/search_meal.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

class MockMealRepository extends Mock implements MealRepository {}

void main() {
  late SearchMeal usecase;
  late MockMealRepository mockRepository;

  setUp(() {
    mockRepository = MockMealRepository();
    usecase = SearchMealImpl(mockRepository);
  });

  group('SearchMeal', () {
    test(
      'Must call mockRepository.searchMealByName and return List<MealDetail> when success',
      () async {
        when(
          () => mockRepository.searchMealByName(any()),
        ).thenAnswer((_) async => tListMealDetail);

        final result = await usecase(tName);

        expect(result, tListMealDetail);
        verify(() => mockRepository.searchMealByName(tName)).called(1);
      },
    );
  });
}
