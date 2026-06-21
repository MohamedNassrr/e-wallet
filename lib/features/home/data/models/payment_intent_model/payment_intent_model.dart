

class PaymentIntentModel {
  String? clientSecret;

  PaymentIntentModel({this.clientSecret});

  factory PaymentIntentModel.fromJson(Map<String, dynamic> json) {
    return PaymentIntentModel(clientSecret: json['client_secret'] as String?);
  }

  Map<String, dynamic> toJson() => {'client_secret': clientSecret};
}
