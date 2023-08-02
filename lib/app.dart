import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instapound/src/config/themes/app_theme.dart';
import 'package:instapound/src/config/themes/dark_theme.dart';
import 'package:instapound/src/features/auth/presentation/screens/signin/cubit/sign_in_cubit.dart';
import 'package:instapound/src/features/auth/presentation/screens/signin/signin.dart';
import 'package:instapound/src/injectores.dart' as di;

class Instapound extends StatelessWidget {
  const Instapound({super.key});

  @override
  Widget build(BuildContext context) {
    // final pref =  SharedPreferences.getInstance();
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignInCubit>(create: (context) => di.sl<SignInCubit>()),
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
