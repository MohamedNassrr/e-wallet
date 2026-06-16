import 'package:e_wallet/core/services/api_service.dart';
import 'package:e_wallet/core/services/biometric_service.dart';
import 'package:e_wallet/features/home/data/repos/deposit_repo/deposit_repo_impl.dart';
import 'package:e_wallet/features/home/data/repos/ledger_repo/ledger_repo_impl.dart';
import 'package:e_wallet/features/home/data/repos/transaction_repo/transaction_repo_impl.dart';
import 'package:e_wallet/features/home/data/repos/wallet_repo.dart';
import 'package:e_wallet/features/home/data/services/paymob_service.dart';
import 'package:e_wallet/features/home/data/services/wallet_service.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void serviceLocator() {
  getIt.registerSingleton<BiometricService>(BiometricService());
  getIt.registerSingleton<WalletService>(WalletService());
  getIt.registerSingleton<WalletRepo>(WalletRepo(getIt.get<WalletService>()));
  getIt.registerSingleton<TransactionRepoImpl>(TransactionRepoImpl());

  getIt.registerSingleton<LedgerRepoImpl>(LedgerRepoImpl());
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<DepositRepoImpl>(
    DepositRepoImpl(getIt.get<ApiService>()),
  );

  getIt.registerSingleton<PaymobService>(
    PaymobService(getIt.get<DepositRepoImpl>()),
  );
}
