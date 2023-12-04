import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int userId;
  String email;
  String token;
  bool isAdmin;
  String fullName;

  User({
    this.userId = 0,
    this.email = "",
    this.token = "",
    this.fullName = "",
    this.isAdmin = false,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["userId"] ?? 0,
        email: json["email"] ?? '',
        token: json["token"] ?? '',
        fullName: json["fullName"] ?? '',
        isAdmin: json["isAdmin"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "email": email,
        "token": token,
        "isAdmin": isAdmin,
        "fullName": fullName,
      };
}
