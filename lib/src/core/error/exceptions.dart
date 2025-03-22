abstract class Exceptions {
  final String errormessage;

  Exceptions({required this.errormessage});
}

class ServerException extends Exceptions {
  ServerException({required String errormessage}) : super(errormessage: errormessage);
}

class NetworkException extends Exceptions {
  NetworkException({required String errormessage}) : super(errormessage: errormessage);
}
