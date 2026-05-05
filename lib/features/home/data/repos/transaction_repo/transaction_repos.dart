import 'package:e_wallet/features/home/data/models/ledger_model.dart';

abstract class TransactionRepo {
  Future<void> runTransaction({
    required String receiverPhone,
    required double amount,
    required String idempotencyKey,
    required TransactionType type,
  });
}
