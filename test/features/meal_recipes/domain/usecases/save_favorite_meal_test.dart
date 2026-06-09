import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meal_explorer/features/meal_recipes/domain/repositories/meal_repository.dart';
import 'package:meal_explorer/features/meal_recipes/domain/usecases/save_favorite_meal.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

class MockMealRepository extends Mock implements MealRepository {}

void main() {
  late MockMealRepository mockRepository;
  late SaveFavoriteMeal usecase;

  setUp(() {
    mockRepository = MockMealRepository();
    usecase = SaveFavoriteMealImpl(mockRepository);
  });

  setUpAll(() {
    registerFallBackValues();
  });

  group('SaveFavoriteMeal', () {
    test(
      'Must call mockRepository.saveFavoriteMeal and return Right(Unit) when success',
      () async {
        when(
          () => mockRepository.saveFavoriteMeal(any()),
        ).thenAnswer((_) async => const Right(unit));

        final result = await usecase(tMealDetail);
        expect(result, Right(unit));
        verify(() => mockRepository.saveFavoriteMeal(tMealDetail)).called(1);
      },
    );

    test(
      'Must call mockRepository.saveFavoriteMeal and return Left(Failure)',
      () async {
        when(
          () => mockRepository.saveFavoriteMeal(any()),
        ).thenAnswer((_) async => Left(tFailure));

        final result = await usecase(tMealDetail);
        expect(result, Left(tFailure));
        verify(() => mockRepository.saveFavoriteMeal(tMealDetail)).called(1);
      },
    );
  });
}
