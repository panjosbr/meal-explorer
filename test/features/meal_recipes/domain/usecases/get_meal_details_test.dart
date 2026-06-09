import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meal_explorer/features/meal_recipes/domain/repositories/meal_repository.dart';
import 'package:meal_explorer/features/meal_recipes/domain/usecases/get_meal_details.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

class MockMealRepository extends Mock implements MealRepository {}

void main() {
  late GetMealDetails usecase;
  late MockMealRepository mockRepository;

  setUp(() {
    mockRepository = MockMealRepository();
    usecase = GetMealDetailsImpl(mockRepository);
  });

  group('GetMealDetails', () {
    test(
      'Must call mockRepository.getMealDetails and return Right(MealDetail) when success',
      () async {
        when(
          () => mockRepository.getMealDetailsById(any()),
        ).thenAnswer((_) async => Right(tMealDetail));

        final result = await usecase(tIdExample);
        expect(result, Right(tMealDetail));
        verify(() => mockRepository.getMealDetailsById(tIdExample)).called(1);
      },
    );

    test(
      'Must call mockRepository.getMealDetails and return Left(Failure)',
      () async {
        when(
          () => mockRepository.getMealDetailsById(any()),
        ).thenAnswer((_) async => Left(tFailure));

        final result = await usecase(tIdExample);
        expect(result, Left(tFailure));
        verify(() => mockRepository.getMealDetailsById(tIdExample)).called(1);
      },
    );
  });
}
