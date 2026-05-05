sealed class TransactionStates {}

final class TransferInitialStates extends TransactionStates {}

final class TransferLoadingStates extends TransactionStates {}

final class TransferSuccessStates extends TransactionStates {}

final class TransferFailureStates extends TransactionStates {
  final String errMessage;

  TransferFailureStates(this.errMessage);
}
