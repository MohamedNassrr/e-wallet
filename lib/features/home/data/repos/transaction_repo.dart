import 'package:e_wallet/core/failures/transaction_failure.dart';
import 'package:e_wallet/features/home/data/services/transaction_service.dart';

class TransactionRepo {
  final TransactionService transactionService;

  TransactionRepo(this.transactionService);

  Future<void> transfer({
    required String receiverPhone,
    required double amount,
    required String idempotencyKey,
  }) async {
    try {
      await transactionService.runTransaction(
        receiverPhone: receiverPhone,
        amount: amount,
        idempotencyKey: idempotencyKey,
      );
    } on TransactionFailure {
      rethrow;
    } catch (e) {
      throw TransactionFailure.unknown(e.toString());
    }
  }
}
