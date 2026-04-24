abstract class AuthStates {}

class AuthInitialStates extends AuthStates {}

class AuthLoadingStates extends AuthStates {}

class AuthSuccessStates extends AuthStates {}

class AuthVerifiedStates extends AuthStates {}

class AuthCodeSubmittedStates extends AuthStates {}

class AuthVerificationFailedStates extends AuthStates {}

class AuthFailureStates extends AuthStates {
  final String failure;

  AuthFailureStates({required this.failure});
}