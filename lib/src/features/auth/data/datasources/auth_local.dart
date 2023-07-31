import 'dart:convert';

import 'package:instapound/src/core/error/exceptions.dart';
import 'package:instapound/src/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUser(UserModel user);
  Future<UserModel> getLastSavedUser(); // no need for this to be future
  Future<bool> deleteUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final Future<SharedPreferences> sharedPreferences;

  AuthLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<void> cacheUser(UserModel user) async {
    final SharedPreferences sharedPreferences = await this.sharedPreferences;
    final String userJsonString = json.encode(user.toJson());
    final bool done = await sharedPreferences.setString('CACHED_USER',
        userJsonString); // TODO: change this key to a constant value in a constants file
    if (!done) {
      // throw Exception("Couldn't cache user");
      throw CacheException();
    }
  }

  @override
  Future<UserModel> getLastSavedUser() async {
    final SharedPreferences sharedPreferences = await this.sharedPreferences;
    final String? userJsonString = sharedPreferences.getString('CACHED_USER');
    if (userJsonString != null) {
      return Future.value(UserModel.fromJson(json.decode(userJsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<bool> deleteUser() async {
    final SharedPreferences sharedPreferences = await this.sharedPreferences;
    return await sharedPreferences.remove('CACHED_USER');
  }
}
