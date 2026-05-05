import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_wallet/features/home/data/repos/ledger_repo/ledger_repo.dart';
import 'package:e_wallet/features/home/presentation/controller/ledger_cubit/ledger_state.dart';

class LedgerCubit extends Cubit<LedgerState> {
  LedgerCubit(this.ledgerRepo) : super(LedgerInitialState());

  final LedgerRepo ledgerRepo;

  Future<void> fetchLedger({bool isRefresh = false}) async {
    if (!isRefresh) emit(LedgerLoadingState());

    var result = await ledgerRepo.fetchLedger();

    result.fold(
      (failure) {
        log('failure in ledger trigger : ${failure.toString()}');
        emit(LedgerFailureState(failure.message));
      },
      (success) {
        if (success.isEmpty) {
          emit(LedgerEmptyState());
        } else {
          emit(LedgerSuccessState(success));
        }
      },
    );
  }
}
