import 'dart:convert';
import 'package:frontend_marketplus/usuarios/domain/model/auth_response.dart';
import 'package:frontend_marketplus/usuarios/domain/model/login_request.dart';
import 'package:http/http.dart' as http;
import 'package:frontend_marketplus/usuarios/domain/model/sign_up_request.dart';
import 'package:frontend_marketplus/usuarios/domain/repository/user_repository.dart';

class UserRestRepository extends UserRepository {
  @override
  Future<AuthResponse> login(LoginRequest loginRequest) async {
    var url = Uri.parse('http://10.0.2.2:8080/api/auth/login');

    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': loginRequest.email,
        'password': loginRequest.password,
      }),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return AuthResponse(
        id: data['id'],
        name: data['name'],
        email: data['email'],
        password: data['password'],
        role: data['role'],
        token: data['token'],
      );
    } else {
      throw Exception('Failed to log in user');
    }
  }

  @override
  Future<AuthResponse> signUp(SignUpRequest signUpRequest) async {
    var url = Uri.parse('http://10.0.2.2:8080/api/auth/signup');
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': signUpRequest.name,
        'email': signUpRequest.email,
        'password': signUpRequest.password,
      }),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return AuthResponse(
        id: data['id'],
        name: data['name'],
        email: data['email'],
        password: data['password'],
        role: data['role'],
        token: data['token'],
      );
    } else {
      throw Exception('Failed to register user');
    }
  }
}
