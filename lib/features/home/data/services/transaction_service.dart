import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_wallet/core/failures/transaction_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class TransactionService {
  Future<void> runTransaction({
    required String receiverPhone,
    required double amount,
    required String idempotencyKey,
  }) async {
    final transactionId = const Uuid().v4();
    final senderId = FirebaseAuth.instance.currentUser!.uid;
    final firestore = FirebaseFirestore.instance;

    if (amount <= 0) throw TransactionFailure.invalidAmount();
    final query = await firestore
        .collection('users')
        .where('phoneNumber', isEqualTo: receiverPhone)
        .limit(1)
        .get();

    if (query.docs.isEmpty) {
      throw TransactionFailure.receiverNotFound();
    }

    final receiverId = query.docs.first.id;
    if (senderId == receiverId) throw TransactionFailure.selfTransfer();

    await firestore.runTransaction((transaction) async {
      final idempotencyRef = firestore
          .collection('idempotency')
          .doc(idempotencyKey);
      final senderRef = firestore.collection('wallets').doc(senderId);
      final receiverRef = firestore.collection('wallets').doc(receiverId);
      final ledgerRef = firestore.collection('ledgers').doc(transactionId);

      final idempotencySnap = await transaction.get(idempotencyRef);
      if (idempotencySnap.exists) throw TransactionFailure.alreadyProcessed();

      final senderSnap = await transaction.get(senderRef);
      final receiverSnap = await transaction.get(receiverRef);
      if (!senderSnap.exists) throw TransactionFailure.senderNotFound();
      if (!receiverSnap.exists) throw TransactionFailure.receiverNotFound();

      final senderBalance = (senderSnap['balance'] as num).toDouble();
      final receiverBalance = (receiverSnap['balance'] as num).toDouble();

      if (senderBalance < amount) {
        throw TransactionFailure.insufficientBalance();
      }

      transaction.update(senderRef, {'balance': senderBalance - amount});
      transaction.update(receiverRef, {'balance': receiverBalance + amount});

      transaction.set(ledgerRef, {
        'from': senderId,
        'to': receiverId,
        'amount': amount,
        'status': 'success',
        'transactionId': transactionId,
        'idempotencyKey': idempotencyKey,
        'timestamp': FieldValue.serverTimestamp(),
      });
      transaction.set(idempotencyRef, {
        'status': 'success',
        'transactionId': transactionId,
      });
    });
  }
}
