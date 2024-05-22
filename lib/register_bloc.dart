import 'package:flutter/material.dart';
import 'home.dart';
import 'package:frontend_marketplus/services/api_service.dart';

class RegisterBloc extends ChangeNotifier {
  final ApiService apiService;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  RegisterBloc({required this.apiService});

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> register(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      _setLoading(true);
      final response = await apiService.registerUser({
        'nombreCompleto': userNameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        
      });
      _setLoading(false);

      if (response.statusCode == 200) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error al registrarse. Por favor, inténtalo de nuevo.')),
        );
      }
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
