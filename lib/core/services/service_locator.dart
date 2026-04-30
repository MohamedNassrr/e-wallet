import 'package:e_wallet/core/services/biometric_service.dart';
import 'package:e_wallet/features/home/data/repos/wallet_repo.dart';
import 'package:e_wallet/features/home/data/services/wallet_service.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void serviceLocator() {
  getIt.registerSingleton<BiometricService>(BiometricService());
  getIt.registerSingleton<WalletService>(WalletService());
  getIt.registerSingleton<WalletRepo>(WalletRepo(getIt.get<WalletService>()));
}
