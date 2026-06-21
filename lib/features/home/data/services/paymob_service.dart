import 'dart:developer';

import 'package:e_wallet/core/themes/app_color.dart';
import 'package:e_wallet/features/home/data/repos/deposit_repo/deposit_repo.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:paymob/paymob.dart';

class PaymobService {
  final DepositRepo depositRepo;

  PaymobService(this.depositRepo);
  Future<bool> payWithPaymob({
    required double amount,
    required String csKey,
  }) async {
    final result = await Paymob.pay(
      publicKey: dotenv.get('PAYMOB_PK'),
      clientSecret: csKey,
      appName: 'e-wallet',
      buttonBackgroundColor: AppColors.mainColor,
      buttonTextColor: AppColors.white,
      saveCardDefault: true,
      showSaveCard: true,
    );
    
    log('isSuccessful: ${result.isSuccessful}');
    log('status: ${result.status}');
    log('error: ${result.errorMessage}');
    return result.isSuccessful;
  }
}
