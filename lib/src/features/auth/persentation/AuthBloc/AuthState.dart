

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final String displayName;
  final String email;

  Authenticated({required this.displayName, required this.email});
}

class Unauthenticated extends AuthState {}

class NeedsEmailVerification extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}

class VerificationEmailSent extends AuthState {
  final String message;

  VerificationEmailSent({required this.message});
}

class EmailVerified extends AuthState {}
