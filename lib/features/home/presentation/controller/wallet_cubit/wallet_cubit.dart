import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_wallet/features/home/data/repos/wallet_repo.dart';
import 'package:e_wallet/features/home/presentation/controller/wallet_cubit/wallet_state.dart';

class WalletCubit extends Cubit<WalletStates> {
  WalletCubit(this._walletRepo) : super(WalletInitialStates());

  final WalletRepo _walletRepo;

  Future<void> createWallet() async {
    emit(WalletLoadingStates());
    try {
      await _walletRepo.createWallet();
      if (isClosed) return;
      emit(WalletSuccessStates());
    } catch (failure) {
      log('wallet failure: $failure');
      emit(WalletFailureStates(failure.toString()));
    }
  }

  StreamSubscription? _walletSub;
  Future<void> fetchWallet() async {
    emit(FetchWalletLoadingStates());

    _walletSub?.cancel();

    _walletSub = _walletRepo.fetchWallet().listen(
      (wallet) {
        if (isClosed) return;
        emit(FetchWalletSuccessStates(wallet));
      },
      onError: (error) {
        if (isClosed) return;
        emit(FetchWalletFailureStates(error.toString()));
      },
    );
  }
}
