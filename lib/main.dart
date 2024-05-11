import 'package:flutter/material.dart';
import 'welcome.dart'; 
import 'colors.dart'; // Asegúrate de que este import esté correcto

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor, // Usa el color primario definido
        useMaterial3: true,
        textTheme: TextTheme(
          headline4: TextStyle(
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

