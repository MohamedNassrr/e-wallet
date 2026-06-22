import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_wallet/core/failures/transaction_failure.dart';
import 'package:e_wallet/features/home/data/models/ledger_model.dart';
import 'package:e_wallet/features/home/data/repos/deposit_repo/deposit_repo.dart';
import 'package:e_wallet/features/home/data/repos/transaction_repo/transaction_repos.dart';
import 'package:e_wallet/features/home/data/services/paymob_service.dart';
import 'package:e_wallet/features/home/presentation/controller/transaction_cubit/transaction_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class TransactionCubit extends Cubit<TransactionStates> {
  TransactionCubit(this.transactionRepo, this.depositRepo, this.paymobService)
    : super(TransactionInitialStates());

  final TransactionRepo transactionRepo;
  String? _currentIdempotencyKey;
  Future<void> transfer({
    required String receiverPhone,
    required double amount,
  }) async {
    emit(TransferLoadingStates());
    _currentIdempotencyKey ??= const Uuid().v4();

    try {
      await transactionRepo.runTransaction(
        receiverPhone: '+2$receiverPhone',
        amount: amount,
        idempotencyKey: _currentIdempotencyKey!,
        type: TransactionType.transfer,
      );
      emit(TransferSuccessStates());
      _currentIdempotencyKey = null;
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

  final DepositRepo depositRepo;
  final PaymobService paymobService;
  String? _depositCurrentIdempotencyKey;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> deposit({required double amount}) async {
    emit(DepositPendingStates());
    _depositCurrentIdempotencyKey ??= const Uuid().v4();

    try {
      final intent = await depositRepo.runDeposit(amount: amount);

      await paymobService.payWithPaymob(
        amount: amount,
        csKey: intent.clientSecret!,
      );

      await FirebaseFirestore.instance
          .collection('wallets')
          .doc(_auth.currentUser!.uid)
          .update({'balance': FieldValue.increment(amount)});
      await FirebaseFirestore.instance
          .collection('ledgers')
          .doc(_depositCurrentIdempotencyKey)
          .set(
            LedgerModel(
              transactionType: TransactionType.deposit,
              from: _auth.currentUser!.uid,
              amount: amount,
              receiverPhone: 'Me',
              status: 'success',
              transactionId: _depositCurrentIdempotencyKey!,
            ).toJson(),
          );
      emit(DepositSuccessStates());
    } catch (e) {
      log('deposit failure : $e');
      emit(DepositFailureStats(e.toString()));
    }
  }
}
