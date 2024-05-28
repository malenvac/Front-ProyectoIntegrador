
import 'package:frontend_marketplus/usuarios/domain/model/login_request.dart';
import 'package:frontend_marketplus/usuarios/domain/model/login_response.dart';
import 'package:frontend_marketplus/usuarios/domain/model/sign_up_request.dart';
import 'package:frontend_marketplus/usuarios/domain/model/user.dart';

abstract class UserRepository {

    Future<User> signUp(SignUpRequest signUpRequest);
    Future<LoginResponse> login(LoginRequest loginRequest);
}
