class UserModel {
  String? phoneNumber;
  String? uId;
  dynamic createdAt;

  UserModel({
    required this.phoneNumber,
    required this.uId,
    required this.createdAt,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
    uId = json['uId'];
    createdAt = json['phoneNumber'];
  }
  Map<String, dynamic> toMap() {
    return {'phoneNumber': phoneNumber, 'uId': uId, 'createdAt': createdAt};
  }
}
