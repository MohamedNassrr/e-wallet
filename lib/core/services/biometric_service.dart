import 'dart:developer';

import 'package:local_auth/local_auth.dart';

class BiometricService {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> canCheckBiometrics() async {
    return await auth.canCheckBiometrics;
  }

  Future<bool> biometricAuth() async {
    try {
      final result = await auth.authenticate(
        localizedReason: 'Confirm it\'s you to continue',
        biometricOnly: false,
      );

      log('Biometric result: $result');

      return result;
    } on LocalAuthException catch (e) {
      log(e.toString());
      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
