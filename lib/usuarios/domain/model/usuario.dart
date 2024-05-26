class Usuario {

  final int id;
  final String nombre;
  final String correo;
  final String password;

  Usuario({
    required this.id,
    required this.nombre,
    required this.correo,
    required this.password
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
    id: json["id"],
    nombre: json["nombre"],
    correo: json["correo"],
    password: json["contraseña"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombre": nombre,
    "correo": correo,
    "contraseña": password
  };
}