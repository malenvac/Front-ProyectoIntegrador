
import 'package:frontend_marketplus/usuarios/domain/model/login_request.dart';
import 'package:frontend_marketplus/usuarios/domain/model/login_response.dart';
import 'package:frontend_marketplus/usuarios/domain/model/sign_up_request.dart';
import 'package:frontend_marketplus/usuarios/domain/model/usuario.dart';

abstract class UsuarioRepository {

    Future<Usuario> registrar(SignUpRequest signUpRequest);
    Future<LoginResponse> iniciarSesion(LoginRequest loginRequest);
}
