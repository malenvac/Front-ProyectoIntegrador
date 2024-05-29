import 'package:frontend_marketplus/usuarios/domain/model/auth_response.dart';
import 'package:frontend_marketplus/usuarios/domain/model/login_request.dart';
import 'package:frontend_marketplus/usuarios/domain/repository/user_repository.dart';

class Login {
  final UserRepository userRepository;

  Login(this.userRepository);

  Future<AuthResponse> run(LoginRequest loginRequest) {
    return userRepository.login(loginRequest);
  }
}
