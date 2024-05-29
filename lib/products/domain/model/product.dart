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
        price: BigDecimal.fromJson(json["price"]),
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

  factory BigDecimal.fromJson(String json) => BigDecimal(json);

  String toJson() => value;
}
