import 'package:flutter/material.dart';
import 'package:instapound/src/core/utils/app_strings.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(AppStrings.appName),
        ),
      ),
    );
  }
}
