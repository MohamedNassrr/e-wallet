sealed class TransactionStates {}

final class TransactionInitialStates extends TransactionStates {}

final class TransferLoadingStates extends TransactionStates {}

final class TransferSuccessStates extends TransactionStates {}

final class TransferFailureStates extends TransactionStates {
  final String errMessage;

  TransferFailureStates(this.errMessage);
}

final class DepositInitialStates extends TransactionStates {}

final class DepositPendingStates extends TransactionStates {}

final class DepositSuccessStates extends TransactionStates {}

final class DepositFailureStats extends TransactionStates {
  final String errMessage;

  DepositFailureStats(this.errMessage);
}
