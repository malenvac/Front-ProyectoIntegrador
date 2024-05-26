import 'package:frontend_marketplus/usuarios/domain/model/sign_up_request.dart';
import 'package:frontend_marketplus/usuarios/domain/model/usuario.dart';
import 'package:frontend_marketplus/usuarios/domain/repository/usuario_repository.dart';

class RegistrarUsuario {

  final UsuarioRepository usuarioRepository;

  RegistrarUsuario(this.usuarioRepository);

  Future<Usuario> run(SignUpRequest signUpRequest) {
    return usuarioRepository.registrar(signUpRequest);
  }
}