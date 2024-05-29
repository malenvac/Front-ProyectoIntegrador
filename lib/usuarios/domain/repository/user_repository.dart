
import 'package:frontend_marketplus/usuarios/domain/model/auth_response.dart';
import 'package:frontend_marketplus/usuarios/domain/model/login_request.dart';
import 'package:frontend_marketplus/usuarios/domain/model/sign_up_request.dart';

abstract class UserRepository {

    Future<AuthResponse> signUp(SignUpRequest signUpRequest);
    Future<AuthResponse> login(LoginRequest loginRequest);
}
