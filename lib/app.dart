import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instapound/src/config/themes/app_theme.dart';
import 'package:instapound/src/config/themes/dark_theme.dart';
import 'package:instapound/src/core/network/network_info.dart';
import 'package:instapound/src/features/auth/data/datasources/auth_local.dart';
import 'package:instapound/src/features/auth/data/datasources/auth_remote.dart';
import 'package:instapound/src/features/auth/data/repsitories/auth_repo_impl.dart';
import 'package:instapound/src/features/auth/domain/usecases/sign_in_uc.dart';
import 'package:instapound/src/features/auth/presentation/screens/signin/cubit/sign_in_cubit.dart';
import 'package:instapound/src/features/auth/presentation/screens/signin/signin.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Instapound extends StatelessWidget {
  const Instapound({super.key});

  @override
  Widget build(BuildContext context) {
    // final pref =  SharedPreferences.getInstance();
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignInCubit>(
          create: (context) => SignInCubit(
              // signInUseCase: context.read(),
              signInUseCase: SignInUCR(
            repository: AuthRepositoryImpl(
              remoteDataSource: AuthRemoteDataSourceImpl(
                  client: Dio(
                BaseOptions(
                  baseUrl:
                      "http://womansafety-env.eba-fdpcfy2q.us-east-1.elasticbeanstalk.com",
                  // connectTimeout: 5000,
                  // receiveTimeout: 3000,
                ),
              )),
              localDataSource: AuthLocalDataSourceImpl(
                sharedPreferences: SharedPreferences.getInstance(),
              ),
              networkInfo: NetworkInfoImpl(
                connectionChecker: InternetConnectionChecker(),
              ),
            ),
          )),
        ),
      ],
      child: MaterialApp(
        title: 'Instapound',
        theme: appTheme(),
        darkTheme: appDarkTheme(),
        themeMode: ThemeMode.light,
        home: const SignInScreen(),
      ),
    );
  }
}
