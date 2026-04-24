import 'package:local_auth/local_auth.dart';

class BiometricFailure {
  final String message;

  const BiometricFailure(this.message);
}

class BiometricFailureMapper {
  static BiometricFailure map(LocalAuthException e) {
    switch (e.code) {
      case LocalAuthExceptionCode.noBiometricHardware:
        return const BiometricFailure(
          "This device doesn't support fingerprint or face recognition.",
        );

      case LocalAuthExceptionCode.noBiometricsEnrolled:
        return const BiometricFailure(
          "No biometric data found. Please set up fingerprint or face ID in your device settings.",
        );

      case LocalAuthExceptionCode.biometricLockout:
      case LocalAuthExceptionCode.temporaryLockout:
        return const BiometricFailure(
          "Too many attempts. Please try again later or use your device PIN.",
        );

      case LocalAuthExceptionCode.userCanceled:
        return const BiometricFailure("Authentication canceled.");

      default:
        return const BiometricFailure(
          "Authentication failed. Please try again.",
        );
    }
  }
}
