class ServerException implements Exception {
  final String message;

  const ServerException(this.message);
}

class InternalException implements Exception {
  final String message;

  const InternalException(this.message);
}

class LocalDataException implements Exception {
  final String message;

  const LocalDataException(this.message);
}

class NotFoundException implements Exception {}
