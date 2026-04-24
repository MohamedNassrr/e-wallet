import 'package:e_wallet/core/services/biometric_service.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void serviceLocator() {
  getIt.registerSingleton<BiometricService>(BiometricService());
}
