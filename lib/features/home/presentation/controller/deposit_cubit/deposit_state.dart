sealed class DepositState {}

final class DepositInitialStates extends DepositState {}

final class DepositPendingStates extends DepositState {}

final class DepositSuccessStates extends DepositState {}

final class DepositFailureStats extends DepositState {
  final String errMessage;

  DepositFailureStats(this.errMessage);
}
