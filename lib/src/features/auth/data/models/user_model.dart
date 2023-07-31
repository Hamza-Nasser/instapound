import 'package:instapound/src/features/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.name,
    required super.email,
    required super.username,
    required super.photoUrl,
    required super.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['user']["name"],
        email: json['user']["email"],
        username: json['user']["username"],
        photoUrl: json['user']["image"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "username": username,
        "image": photoUrl,
      };
}
