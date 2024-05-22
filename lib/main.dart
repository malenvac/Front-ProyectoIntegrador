import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'welcome.dart'; 
import 'colors.dart'; 
import 'login_bloc.dart';
import 'services/api_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginBloc(apiService: ApiService(baseUrl: 'http://localhost:9090')),
        ),
      ],
      child: const MyApp(),
    ),
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
