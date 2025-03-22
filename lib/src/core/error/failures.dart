
abstract class Failure {
  final String errormessage;

  Failure({required this.errormessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errormessage});
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.errormessage});
}
