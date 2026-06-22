import 'dart:developer';

import 'package:e_wallet/core/failures/local_auth_failure.dart';
import 'package:local_auth/local_auth.dart';

class BiometricService {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> canCheckBiometrics() async {
    return await auth.canCheckBiometrics;
  }

  Future<dynamic> biometricAuth() async {
    try {
      
      final result =  await auth.authenticate(
        localizedReason: 'Confirm it\'s you to continue',
        biometricOnly: false,
      );
        log('raw result from local_auth: $result');
        return result;
    } on LocalAuthException catch (e) {
       log('exception: $e');
      return BiometricFailureMapper.map(e);
    } catch (_) {
      
      return const BiometricFailure("Something went wrong. Try again.");
    }
  }
}
