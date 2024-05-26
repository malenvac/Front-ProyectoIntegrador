import 'package:flutter/material.dart';
import 'usuarios/infrastructure/ui/screen/welcome.dart';
import 'colors.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MarketPlus',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}
