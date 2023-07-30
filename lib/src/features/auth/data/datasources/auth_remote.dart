import 'dart:convert';

import 'package:instapound/src/core/api/endpoints.dart';
import 'package:instapound/src/core/error/exceptions.dart';
import 'package:instapound/src/features/auth/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<UserModel> signIn(String email, String password);
}

// TODO: implement with firebase
// TODO: implement with dio package
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl({required this.client});
  @override
  Future<UserModel> signIn(String email, String password) async {
    final url = Uri.parse(Endpoints.signIn);
    final body = {
      "email": email,
      "password": password,
    };
    final http.Response response = await client.post(url, body: body, headers: {
      "Content-Type": "application/json", // TODO: change this to a constant
    });
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      // throw Exception("Couldn't sign in");
      // throw ServerException(message: "Couldn't sign in");
      throw ServerException();
    }
  }
}
