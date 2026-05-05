import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_wallet/core/failures/transaction_failure.dart';
import 'package:e_wallet/features/home/data/repos/transaction_repo.dart';
import 'package:e_wallet/features/home/presentation/controller/transfer_cubit/transfer_state.dart';
import 'package:uuid/uuid.dart';

class TransactionCubit extends Cubit<TransactionStates> {
  TransactionCubit(this.transactionRepo) : super(TransferInitialStates());

  final TransactionRepo transactionRepo;
  String? _currentIdempotencyKey;
  Future<void> transfer({
    required String receiverPhone,
    required double amount,
  }) async {
    emit(TransferLoadingStates());
     _currentIdempotencyKey ??= const Uuid().v4();

    try {
      await transactionRepo.transfer(
        receiverPhone: '+2$receiverPhone',
        amount: amount,
        idempotencyKey: _currentIdempotencyKey!,
      );
      emit(TransferSuccessStates());
      _currentIdempotencyKey =null;
    } catch (e) {
      if (e is TransactionFailure) {
        _currentIdempotencyKey = null;
        log('tranfer failure: ${e.message.toString()}');
        emit(TransferFailureStates(e.message));
      } else {
        log('unkown tranfer failure: ${e.toString()}');
        emit(TransferFailureStates("Unknown error"));
      }
    }
  }
}
