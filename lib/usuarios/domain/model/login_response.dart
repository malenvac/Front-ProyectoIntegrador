class LoginResponse{

  final String correo;
  final String token;

  LoginResponse({
    required this.correo,
    required this.token
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    correo: json["correo"],
    token: json["token"]
  );

    Map<String, dynamic> toJson() => {
    "correo": correo,
    "token": token
  };
}