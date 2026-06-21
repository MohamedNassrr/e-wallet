import 'package:e_wallet/core/failures/local_auth_failure.dart';
import 'package:local_auth/local_auth.dart';

class BiometricService {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> canCheckBiometrics() async {
    return await auth.canCheckBiometrics;
  }

  Future<dynamic> biometricAuth() async {
    try {
      return await auth.authenticate(
        localizedReason: 'Confirm it\'s you to continue',
        biometricOnly: false,
      );
    } on LocalAuthException catch (e) {
      return BiometricFailureMapper.map(e);
    } catch (_) {
      return const BiometricFailure("Something went wrong. Try again.");
    }
  }
}
