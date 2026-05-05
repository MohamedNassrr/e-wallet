import 'package:e_wallet/features/home/data/models/ledger_model.dart';

sealed class LedgerState {}

final class LedgerInitialState extends LedgerState {}

final class LedgerLoadingState extends LedgerState {}
final class LedgerEmptyState extends LedgerState {}

final class LedgerSuccessState extends LedgerState {
  final List<LedgerModel> ledgerModel;

  LedgerSuccessState(this.ledgerModel);
}

final class LedgerFailureState extends LedgerState {
  final String errMessage;

  LedgerFailureState(this.errMessage);
}
