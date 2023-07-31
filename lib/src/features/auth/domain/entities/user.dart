import 'package:equatable/equatable.dart';

class User extends Equatable {

  final String name;
  final String email;
  final String username;
  final String photoUrl;
  final String token;

  const User({

    required this.name,
    required this.email,
    required this.username,
    required this.photoUrl,
    required this.token,
  });

  @override
  List<Object> get props => [

        name,
        email,
        username,
        photoUrl,
        token,
      ];
}
