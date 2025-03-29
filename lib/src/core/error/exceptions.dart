abstract class Exceptions {
  final String errormessage;

  Exceptions({required this.errormessage});
}

class ServerException extends Exceptions {
  ServerException({required super.errormessage});
}

class NetworkException extends Exceptions {
  NetworkException({required super.errormessage});
}
