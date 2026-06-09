import 'package:dartz/dartz.dart';
import 'package:meal_explorer/features/meal_recipes/data/datasources/meal_local_data_source.dart';
import 'package:meal_explorer/features/meal_recipes/data/datasources/meal_remote_data_source.dart';
import 'package:meal_explorer/features/meal_recipes/data/exceptions.dart';
import 'package:meal_explorer/features/meal_recipes/domain/entities/meal_detail.dart';
import 'package:meal_explorer/features/meal_recipes/domain/failures.dart';
import 'package:meal_explorer/features/meal_recipes/domain/repositories/meal_repository.dart';

class MealRepositoryImpl extends MealRepository {
  final MealRemoteDataSource remoteDataSource;
  final MealLocalDataSource localDataSource;

  MealRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<MealDetail>>> getFavoriteMeals() async {
    try {
      final meals = await localDataSource.getFavoritesMeals();
      return Right(meals);
    } on NotFoundException {
      return Left(NotFoundFailure('Não ha receitas salvas como favoritas'));
    } catch (e) {
      return Left(GeneralFailure('$e'));
    }
  }

  @override
  Future<Either<Failure, MealDetail>> getMealDetailsById(String id) async {
    try {
      final mealDetail = await remoteDataSource.getMealDetailsById(id);
      return Right(mealDetail);
    } on NotFoundException {
      return Left(NotFoundFailure('Receita não encontrada'));
    } catch (e) {
      return Left(GeneralFailure('$e'));
    }
  }

  @override
  Future<Either<Failure, MealDetail>> getRandomMeal() async {
    try {
      final mealDetail = await remoteDataSource.getRandomMeal();
      return Right(mealDetail);
    } on NotFoundException {
      return Left(NotFoundFailure('Não foi encontrada nenhuma receita.'));
    } catch (e) {
      return Left(GeneralFailure('$e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFavoriteMealById(String id) async {
    try {
      await localDataSource.removeFavoriteMeal(id);
      return Right(unit);
    } catch (e) {
      return Left(GeneralFailure('$e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveFavoriteMeal(MealDetail meal) async {
    try {
      await localDataSource.saveFavoriteMeals(meal);
      return Right(unit);
    } catch (e) {
      return Left(GeneralFailure('$e'));
    }
  }

  @override
  Future<Either<Failure, List<MealDetail>>> searchMealByName(
    String name,
  ) async {
    try {
      final mealDetail = await remoteDataSource.searchMealsByName(name);
      return Right(mealDetail);
    } on NotFoundException {
      return Left(
        NotFoundFailure('Não foram encontradas receitas com o nome: $name'),
      );
    } catch (e) {
      return Left(GeneralFailure('$e'));
    }
  }
}
