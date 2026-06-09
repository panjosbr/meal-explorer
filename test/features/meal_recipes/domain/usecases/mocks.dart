import 'package:meal_explorer/features/meal_recipes/domain/entities/meal_detail.dart';
import 'package:meal_explorer/features/meal_recipes/domain/failures.dart';
import 'package:mocktail/mocktail.dart';

const tMealDetail = MealDetail(
  id: '1234',
  name: 'Chicken',
  imageUrl: 'thumb.jpg',
  ingredients: [],
  instructions: 'instructions',
);

const tListMealDetail = [tMealDetail];
const tIdExample = '1234';
const tName = 'chicken';
const tFailure = GeneralFailure('Generic error.');
const tFavoriteMeals = [
  MealDetail(
    id: '123',
    name: 'A',
    imageUrl: '',
    instructions: '',
    ingredients: [],
  ),
  tMealDetail,
];

void registerFallBackValues() {
  registerFallbackValue(tMealDetail);
}
