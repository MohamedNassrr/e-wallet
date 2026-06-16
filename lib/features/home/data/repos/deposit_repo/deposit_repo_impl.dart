import 'dart:developer';

import 'package:e_wallet/core/services/api_service.dart';
import 'package:e_wallet/features/home/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:e_wallet/features/home/data/repos/deposit_repo/deposit_repo.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DepositRepoImpl implements DepositRepo {
  final ApiService apiService;

  DepositRepoImpl(this.apiService);
  @override
  Future<PaymentIntentModel> runDeposit({required double amount}) async {
    try {
      var data = await apiService.post(
        data: {
          "amount": amount * 100,
          "currency": "EGP",
          "payment_methods": [5663529],
          "billing_data": {
            "apartment": "NA",
            "first_name": "Test",
            "last_name": "User",
            "street": "NA",
            "building": "NA",
            "phone_number": "+201234567890",
            "city": "Cairo",
            "country": "EG",
            "email": "test@gmail.com",
            "floor": "NA",
            "state": "NA",
          },
          
        },
        url: 'https://accept.paymob.com/v1/intention/',
        token: dotenv.get('PAYMOB_CSK'),
      );
      return PaymentIntentModel.fromJson(data);
    } catch (e) {
      log('deposit failure: ${e.toString()}');
      throw Exception();
    }
  }
}
