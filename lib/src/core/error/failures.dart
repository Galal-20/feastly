abstract class Failures {
  final String message;

  Failures({required this.message});
}

class GeminiFailures extends Failures {
  GeminiFailures({required super.message});

  @override
  String toString() => message;

  @override
  int get hashCode => message.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeminiFailures &&
          runtimeType == other.runtimeType &&
          message == other.message;
}

class UserFailures extends Failures {
  UserFailures({required super.message});
}
class ServerFailure extends Failure {
  ServerFailure({required super.errormessage});
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.errormessage});
}
