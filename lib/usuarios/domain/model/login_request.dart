class LoginRequest {

  final String correo;
  final String password;

  LoginRequest({
    required this.correo,
    required this.password
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
    correo: json["correo"],
    password: json["contraseña"]
  );

    Map<String, dynamic> toJson() => {
    "correo": correo,
    "contraseña": password
  };
}