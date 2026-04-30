import 'package:e_wallet/features/home/data/models/wallet_model.dart';
import 'package:e_wallet/features/home/data/services/wallet_service.dart';

class WalletRepo {
  final WalletService _service;

  WalletRepo(this._service);

  Future<void> createWallet() async {
    await _service.createWallet();
  }

  Stream<WalletModel> fetchWallet()  {
    return  _service.getWalletStream();
  }
}
