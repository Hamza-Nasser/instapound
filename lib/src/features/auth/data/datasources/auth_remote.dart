import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:instapound/src/core/api/endpoints.dart';
import 'package:instapound/src/core/error/exceptions.dart';
import 'package:instapound/src/features/auth/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<UserModel> signIn(String email, String password);
}

// TODO: implement with firebase

@Deprecated('Use Dio instead')
class AuthRemoteDataSourceImplHttp implements AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImplHttp({required this.client});
  @override
  Future<UserModel> signIn(String email, String password) async {
    final url = Uri.parse(Endpoints.signIn);
    final body = {"username": "nassor", "password": "password"};

    final http.Response response = await client.post(url, body: body);
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      // throw Exception("Couldn't sign in");
      // throw ServerException(message: "Couldn't sign in");
      throw ServerException(message: json.decode(response.body)['message']);
    }
  }
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio client;

  AuthRemoteDataSourceImpl({required this.client});
  @override
  Future<UserModel> signIn(String email, String password) async {
    final body = {"username": email, "password": password};

    final Response response = await client.post(Endpoints.signIn, data: body);
    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      // throw Exception("Couldn't sign in");
      // throw ServerException(message: "Couldn't sign in");
      throw ServerException(message: response.data['message']);
    }
  }
}
