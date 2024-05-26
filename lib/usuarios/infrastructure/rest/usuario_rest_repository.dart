import 'dart:convert';
import 'package:frontend_marketplus/usuarios/domain/model/login_request.dart';
import 'package:frontend_marketplus/usuarios/domain/model/login_response.dart';
import 'package:http/http.dart' as http;
import 'package:frontend_marketplus/usuarios/domain/model/sign_up_request.dart';
import 'package:frontend_marketplus/usuarios/domain/model/usuario.dart';
import 'package:frontend_marketplus/usuarios/domain/repository/usuario_repository.dart';

class UsuarioRestRepository extends UsuarioRepository {

  @override
  Future<LoginResponse> iniciarSesion(LoginRequest loginRequest) {
    // Implementar según sea necesario
    throw UnimplementedError();
  }

  @override
  Future<Usuario> registrar(SignUpRequest signUpRequest) async {
    var url = Uri.parse('http://10.0.2.2:9090/api/auth/registrar');
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'nombre': signUpRequest.nombre,
        'correo': signUpRequest.correo,
        'contraseña': signUpRequest.password,
      }),
    );

    if (response.statusCode == 201) {
      var data = jsonDecode(response.body);
      return Usuario(
        id: data['id'],
        nombre: data['nombre'],
        correo: data['correo'],
        password: data['contraseña'],
      );
    } else {
      throw Exception('Failed to register user');
    }
  }

}
