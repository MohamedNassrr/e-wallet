class Extras {
  dynamic creationExtras;
  dynamic confirmationExtras;

  Extras({this.creationExtras, this.confirmationExtras});

  factory Extras.fromJson(Map<String, dynamic> json) => Extras(
    creationExtras: json['creation_extras'] as dynamic,
    confirmationExtras: json['confirmation_extras'] as dynamic,
  );

  Map<String, dynamic> toJson() => {
    'creation_extras': creationExtras,
    'confirmation_extras': confirmationExtras,
  };
}
