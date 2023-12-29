import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));
List<User> userListFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

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
        userId: json["id"] ?? 0,
        email: json["email"] ?? '',
        token: json["token"] ?? '',
        fullName: json["fullName"] ?? '',
        isAdmin: json["isAdmin"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": userId,
        "email": email,
        "token": token,
        "isAdmin": isAdmin,
        "fullName": fullName,
      };
}
