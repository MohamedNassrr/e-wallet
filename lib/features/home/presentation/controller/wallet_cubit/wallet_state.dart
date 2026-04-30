import 'package:e_wallet/features/home/data/models/wallet_model.dart';

sealed class WalletStates {}

final class WalletInitialStates extends WalletStates {}

final class WalletLoadingStates extends WalletStates {}

final class WalletSuccessStates extends WalletStates {}

final class WalletFailureStates extends WalletStates {
  final String errMessage;

  WalletFailureStates(this.errMessage);
}

final class FetchWalletLoadingStates extends WalletStates {}

final class FetchWalletSuccessStates extends WalletStates {
  final WalletModel walletModel;

  FetchWalletSuccessStates(this.walletModel);
}

final class FetchWalletFailureStates extends WalletStates {
  final String errMessage;

  FetchWalletFailureStates(this.errMessage);
}
