import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_wallet/features/home/data/models/ledger_model.dart';
import 'package:e_wallet/features/home/data/repos/deposit_repo/deposit_repo.dart';
import 'package:e_wallet/features/home/data/services/paymob_service.dart';
import 'package:e_wallet/features/home/presentation/controller/deposit_cubit/deposit_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class DepositCubit extends Cubit<DepositState> {
  DepositCubit(this.depositRepo, this.paymobService)
    : super(DepositInitialStates());

  final DepositRepo depositRepo;
  final PaymobService paymobService;
  String? _currentIdempotencyKey;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> deposit({required double amount}) async {
    emit(DepositPendingStates());
    _currentIdempotencyKey ??= const Uuid().v4();

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
          .doc(_currentIdempotencyKey)
          .set(
            LedgerModel(
              transactionType: TransactionType.deposit,
              from: _auth.currentUser!.uid,
              amount: amount,
              receiverPhone: 'Me',
              status: 'success',
              transactionId: _currentIdempotencyKey!,
            ).toJson(),
          );
      emit(DepositSuccessStates());
    } catch (e) {
      log('deposit failure : $e');
      emit(DepositFailureStats(e.toString()));
    }
  }
}
