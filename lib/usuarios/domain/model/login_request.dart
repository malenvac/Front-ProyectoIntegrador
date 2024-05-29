class LoginRequest {

  final String email;
  final String password;

  LoginRequest({
    required this.email,
    required this.password
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
    email: json["email"],
    password: json["contraseña"]
  );

    Map<String, dynamic> toJson() => {
    "email": email,
    "contraseña": password
  };
}