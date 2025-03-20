abstract class Failures {
  final String message;

  Failures({required this.message});
}

class GeminiFailures extends Failures {
  GeminiFailures({required super.message});
}

class UserFailures extends Failures {
  UserFailures({required super.message});
}
