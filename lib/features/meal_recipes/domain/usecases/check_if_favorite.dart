abstract class CheckIfFavorite {
  Future<bool> call();
}

class CheckIfFavoriteImpl implements CheckIfFavorite {
  @override
  Future<bool> call() {
    throw UnimplementedError();
  }
}
