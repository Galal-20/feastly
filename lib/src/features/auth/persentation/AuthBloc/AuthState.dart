

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}
class Unauthenticated extends AuthState {}

class Authenticated extends AuthState {
  final String? displayName;
  final String? email;
  Authenticated({this.displayName, this.email});
}

class AuthError extends AuthState {
  final String message;
  AuthError({required this.message});
}