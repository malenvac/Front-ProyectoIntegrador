class Product {
  final String name;
  final BigDecimal price;
  final int quantity;
  final String description;
  final String category;

  Product({
    required this.name,
    required this.price,
    required this.quantity,
    required this.description,
    required this.category,
  });

 factory Product.fromJson(Map<String, dynamic> json) => Product(
  name: json["name"],
  price: BigDecimal.fromJson(json["price"]), // Asegúrate de que aquí maneja tanto String como double
  quantity: json["quantity"],
  description: json["description"],
  category: json["category"],
);

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price.toJson(),
        "quantity": quantity,
        "description": description,
        "category": category,
      };
}

class BigDecimal {
  final String value;

  BigDecimal(this.value);

  factory BigDecimal.fromJson(dynamic json) {
    if (json is double) {
      return BigDecimal(json.toString());
    } else if (json is String) {
      return BigDecimal(json);
    } else {
      throw FormatException('Unexpected type for BigDecimal');
    }
  }
  double toDouble() {
    return double.tryParse(value) ?? 0.0;  // Convertir el valor String a double, con un valor predeterminado si falla la conversión
  }

  String toJson() => value;
}
