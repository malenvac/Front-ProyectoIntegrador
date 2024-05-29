import 'package:frontend_marketplus/usuarios/domain/model/auth_response.dart';
import 'package:frontend_marketplus/usuarios/domain/model/sign_up_request.dart';
import 'package:frontend_marketplus/usuarios/domain/repository/user_repository.dart';

class SignUp {

  final UserRepository userRepository;

  SignUp(this.userRepository);

  Future<AuthResponse> run(SignUpRequest signUpRequest) {
    return userRepository.signUp(signUpRequest);
  }
}