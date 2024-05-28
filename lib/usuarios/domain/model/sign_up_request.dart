class SignUpRequest {

  final String name;
  final String email;
  final String password;

  SignUpRequest({
    required this.name,
    required this.email,
    required this.password
  });

  factory SignUpRequest.fromJson(Map<String, dynamic> json) => SignUpRequest(
    name: json["nombre"],
    email: json["correo"],
    password: json["contraseña"]
  );

  Map<String, dynamic> toJson() => {
    "nombre": name,
    "correo": email,
    "contraseña": password
  };
}