import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
// import 'package:instapound/src/config/router/go.dart';
import 'package:instapound/src/config/themes/app_theme.dart';
import 'package:instapound/src/config/themes/dark_theme.dart';
import 'package:instapound/src/features/auth/presentation/screens/signin/cubit/sign_in_cubit.dart';
import 'package:instapound/src/features/auth/presentation/screens/signin/signin.dart';
import 'package:instapound/src/features/chat/presentaion/screens/chat.dart';
import 'package:instapound/src/injectores.dart' as di;

class Instapound extends StatelessWidget {
  const Instapound({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignInCubit>(create: (context) => di.sl<SignInCubit>()),
      ],
      child: MaterialApp.router(
        title: 'Instapound',
        theme: appTheme(),
        darkTheme: appDarkTheme(),
        themeMode: ThemeMode.light,
        routerConfig: _router,
        // home: const SignInScreen(),
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: "/chat",
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SignInScreen();
      },
    ),
    GoRoute(
      path: '/chat',
      name: 'chat',
      builder: (BuildContext context, GoRouterState state) {
        return const ChatScreen();
      },
    ),
  ],
);
