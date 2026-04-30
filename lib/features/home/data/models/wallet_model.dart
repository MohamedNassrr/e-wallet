

class WalletModel {
  String? userId;
  double? balance;
  dynamic createdAt;
  String? currency;

  WalletModel({
    required this.userId,
    required this.balance,
    required this.createdAt,
    required this.currency,
  });

  WalletModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    balance = json['balance'];
    createdAt = json['phoneNumber'];
    currency = json['currency'];
  }
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'balance': balance,
      'createdAt': createdAt,
      'currency': currency,
    };
  }
}
