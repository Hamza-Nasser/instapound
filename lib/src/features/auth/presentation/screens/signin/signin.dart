import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instapound/src/core/utils/app_assets.dart';
import 'package:instapound/src/core/utils/app_colors.dart';

import 'package:instapound/src/features/auth/presentation/widgets/input_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FocusNode _emailFocus = FocusNode();
  Color _fillColorEmail = AppColors.formFieldFillColor;

  final FocusNode _passwordFocus = FocusNode();
  Color _fillColorPassword = AppColors.formFieldFillColor;

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    ); // to re-show bars
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _emailFocus.addListener(() {
      if (_emailFocus.hasFocus) {
        setState(() {
          _fillColorEmail = AppColors.formFieldFillColorFocus;
        });
      } else {
        setState(() {
          _fillColorEmail = AppColors.formFieldFillColor;
        });
      }
    });
    _passwordFocus.addListener(() {
      if (_passwordFocus.hasFocus) {
        setState(() {
          _fillColorPassword = AppColors.formFieldFillColorFocus;
        });
      } else {
        setState(() {
          _fillColorPassword = AppColors.formFieldFillColor;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomSheet: Container(
        height: 60,
        width: double.infinity,
        color: AppColors.primary,
        child: const Column(
          children: [
            Divider(
              color: Colors.black,
              thickness: 0.2,
              height: 1,
            ),
            SizedBox(height: 25),
            Center(
              child: Text(
                "Instapound from Rejected",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: true,
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "English",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: AppColors.primaryDark),
            ),
            const SizedBox(width: 2),
            SvgPicture.asset(
              AppAssets.downArrow,
              height: 5,
              width: 5,
            )
          ],
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: AppColors.primaryDark,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  // const SizedBox(height: 20),

                  const SizedBox(height: 130),
                  SvgPicture.asset(
                    AppAssets.logo,
                    height: 50,
                    width: 175.34,
                  ),
                  const SizedBox(height: 26),
                  InputFormField(
                    focusNode: _emailFocus,
                    decoration: InputDecoration(
                      hintText: "Phone number, email or username",
                      fillColor: _fillColorEmail,
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 12),
                  InputFormField(
                    focusNode: _passwordFocus,
                    decoration: InputDecoration(
                      hintText: "Password",
                      filled: true,
                      fillColor: _fillColorPassword,
                    ),
                  ),
                  // const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text("Forgot password?"),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Log In'),
                    ),
                  ),
                  const SizedBox(height: 35),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppAssets.facebook,
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(width: 5),
                        const Text("Login with Facebook"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const Divider(
                        color: Colors.black,
                        thickness: 0.2,
                        height: 1,
                      ),
                      Center(
                        child: Container(
                          width: 50,
                          color: AppColors.primary,
                          child: const Center(
                            child: Text(
                              "OR",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // dont have an account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Sign up.",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
