import 'package:flutter/material.dart';
import 'package:frontend_marketplus/home.dart';
import 'package:frontend_marketplus/services/api_service.dart';

class LoginBloc extends ChangeNotifier {
  final ApiService apiService;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  LoginBloc({required this.apiService});

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      _setLoading(true);
      
      await Future.delayed(Duration(seconds: 1));
      _setLoading(false);
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
