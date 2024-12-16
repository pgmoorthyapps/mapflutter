import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maptest/pages/profile_page.dart';
import 'package:provider/provider.dart';

import 'constants/app_theme.dart';
import 'pages/auth/login_page.dart';
import 'providers/login_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GoRouter goRouter = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: '',
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: '/user-profile',
        name: 'user-profile',
        builder: (context, state) => ProfilePage(),
      ),
    ],
  );

  // This widget is the root of your application.
  @override
    Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: MaterialApp.router(
        title: 'MAP',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        routerConfig: goRouter,
      ),
    );
  }
}
