class SignUpRequest {

  final String nombre;
  final String correo;
  final String password;

  SignUpRequest({
    required this.nombre,
    required this.correo,
    required this.password
  });

  factory SignUpRequest.fromJson(Map<String, dynamic> json) => SignUpRequest(
    nombre: json["nombre"],
    correo: json["correo"],
    password: json["contraseña"]
  );

  Map<String, dynamic> toJson() => {
    "nombre": nombre,
    "correo": correo,
    "contraseña": password
  };
}