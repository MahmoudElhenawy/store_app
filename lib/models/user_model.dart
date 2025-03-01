class UserModel {
  String userId;
  String fullName;
  String email;
  bool isEmailVerified;
  String password;
  DateTime createdAt;

  UserModel({
    required this.createdAt,
    required this.userId,
    required this.fullName,
    required this.email,
    required this.isEmailVerified,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "fullName": fullName,
      "email": email,
      "isEmailVerified": isEmailVerified,
      "password": password,
      "createdAt": createdAt.toIso8601String(),
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json["userId"],
      fullName: json["fullName"],
      email: json["email"],
      isEmailVerified: json["isEmailVerified"] ?? false,
      password: json["password"],
      createdAt: DateTime.parse(json["createdAt"]),
    );
  }
}
