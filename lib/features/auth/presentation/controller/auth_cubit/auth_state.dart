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

final class LockInitialStates extends AuthStates {}

final class LockLoadingStates extends AuthStates {}

final class LockUnlockedStates extends AuthStates {}

final class LockFailureStates extends AuthStates {
  final String errMessage;

  LockFailureStates(this.errMessage);
}
