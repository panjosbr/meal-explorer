abstract class Failure {
  final String message;

  const Failure(this.message);
}

class GeneralFailure extends Failure {
  const GeneralFailure(super.message);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message);
}
