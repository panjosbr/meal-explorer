import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meal_explorer/features/meal_recipes/domain/repositories/meal_repository.dart';
import 'package:meal_explorer/features/meal_recipes/domain/usecases/check_if_favorite.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

class MockMealRepository extends Mock implements MealRepository {}

void main() {
  late MockMealRepository mockRepository;
  late CheckIfFavorite usecase;

  setUp(() {
    mockRepository = MockMealRepository();
    usecase = CheckIfFavoriteImpl(repository: mockRepository);
  });

  group('CheckIfFavorite', () {
    test(
      'Must return Right(true) if meal ID belongs to a meal saved in favorites',
      () async {
        when(
          () => mockRepository.getFavoriteMeals(),
        ).thenAnswer((_) async => Right(tFavoriteMeals));

        final result = await usecase(tIdExample);
        expect(result, Right(true));
        verify(() => mockRepository.getFavoriteMeals()).called(1);
      },
    );
    test(
      'Must return Right(false) if meal ID does not belongs to a meal saved in favorites',
      () async {
        when(
          () => mockRepository.getFavoriteMeals(),
        ).thenAnswer((_) async => Right(tFavoriteMeals));

        final result = await usecase('77777');
        expect(result, Right(false));
        verify(() => mockRepository.getFavoriteMeals()).called(1);
      },
    );
    test(
      'Must return Left(Failure) if repository also return Left(failure)',
      () async {
        when(
          () => mockRepository.getFavoriteMeals(),
        ).thenAnswer((_) async => Left(tFailure));

        final result = await usecase(tIdExample);
        expect(result, Left(tFailure));
        verify(() => mockRepository.getFavoriteMeals()).called(1);
      },
    );
  });
}
