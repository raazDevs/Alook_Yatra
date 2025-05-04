import 'package:alok_yatra_app/src/providers/app_functions_provider.dart';
import 'package:alok_yatra_app/src/providers/auth_provider.dart';
import 'package:alok_yatra_app/src/providers/bottom_navigation_provider.dart';
import 'package:alok_yatra_app/src/features/shared/screens/auth_page/sign_in_page.dart';
import 'package:alok_yatra_app/src/routes/app_routes.dart';
import 'package:alok_yatra_app/src/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AppFunctionsProvider()),
      ChangeNotifierProvider(create: (context) => BottomNavigationProvider()),
      ChangeNotifierProvider(create: (context) => AuthProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: SignInPage(),
    );
  }
}
