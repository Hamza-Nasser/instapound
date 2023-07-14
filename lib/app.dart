import 'package:flutter/material.dart';
import 'package:instapound/src/config/themes/app_theme.dart';
import 'package:instapound/src/config/themes/dark_theme.dart';
import 'package:instapound/src/features/auth/presentation/screens/signin/signin.dart';

class Instapound extends StatelessWidget {
  const Instapound({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instapound',
      theme: appTheme(),
      darkTheme: appDarkTheme(),
      themeMode: ThemeMode.light,
      home: const SignInScreen(),
    );
  }
}
