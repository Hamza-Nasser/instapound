import 'package:instapound/src/features/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.photoUrl,
    required super.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        photoUrl: json["photoUrl"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "photoUrl": photoUrl,
        "token": token,
      };
}
