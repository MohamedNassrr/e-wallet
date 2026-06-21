class PaymentKey {
  int? integration;
  String? key;
  String? gatewayType;
  dynamic iframeId;
  int? orderId;
  String? redirectionUrl;
  bool? saveCard;

  PaymentKey({
    this.integration,
    this.key,
    this.gatewayType,
    this.iframeId,
    this.orderId,
    this.redirectionUrl,
    this.saveCard,
  });

  factory PaymentKey.fromJson(Map<String, dynamic> json) => PaymentKey(
    integration: json['integration'] as int?,
    key: json['key'] as String?,
    gatewayType: json['gateway_type'] as String?,
    iframeId: json['iframe_id'] as dynamic,
    orderId: json['order_id'] as int?,
    redirectionUrl: json['redirection_url'] as String?,
    saveCard: json['save_card'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'integration': integration,
    'key': key,
    'gateway_type': gatewayType,
    'iframe_id': iframeId,
    'order_id': orderId,
    'redirection_url': redirectionUrl,
    'save_card': saveCard,
  };
}
