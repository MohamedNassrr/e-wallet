import 'package:e_wallet/features/home/data/models/payment_intent_model/payment_intent_model.dart';

abstract class DepositRepo {
  Future<PaymentIntentModel> runDeposit({required double amount});
}
