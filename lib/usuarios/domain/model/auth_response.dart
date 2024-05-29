class AuthResponse {
  final int id;
  final String name;
  final String email;
  final String password;
  final String role;
  final String token;

  AuthResponse(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.role,
      required this.token});

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      password: json["password"],
      role: json["role"],
      token: json["token"],
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name":name,
        "email": email,
        "password": password,
        "role": role,
        "token": token
      };
}
