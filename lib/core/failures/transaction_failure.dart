class TransactionFailure implements Exception {
  final String message;
  final String code;

  const TransactionFailure({required this.message, required this.code});

  @override
  String toString() => 'TransactionFailure($code: $message)';

  factory TransactionFailure.insufficientBalance() {
    return const TransactionFailure(
      code: 'insufficient_balance',
      message: 'Insufficient balance',
    );
  }

  factory TransactionFailure.senderNotFound() {
    return const TransactionFailure(
      code: 'sender_not_found',
      message: 'Sender wallet not found',
    );
  }

  factory TransactionFailure.receiverNotFound() {
    return const TransactionFailure(
      code: 'receiver_not_found',
      message: 'Receiver wallet not found',
    );
  }

  factory TransactionFailure.invalidAmount() {
    return const TransactionFailure(
      code: 'invalid_amount',
      message: 'Amount must be greater than zero',
    );
  }

  factory TransactionFailure.selfTransfer() {
    return const TransactionFailure(
      code: 'self_transfer',
      message: 'Cannot transfer to self',
    );
  }

  factory TransactionFailure.alreadyProcessed() {
    return const TransactionFailure(
      code: 'idempotency_duplicate',
      message: 'Transaction already processed',
    );
  }

  factory TransactionFailure.unknown([String? details]) {
    return TransactionFailure(
      code: 'unknown_error',
      message: details ?? 'Unknown transaction error occurred',
    );
  }
}
