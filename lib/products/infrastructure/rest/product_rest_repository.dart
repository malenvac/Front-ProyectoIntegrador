import 'dart:convert';

import 'package:frontend_marketplus/products/domain/model/product.dart';
import 'package:frontend_marketplus/products/domain/repository/product_repository.dart';
import 'package:http/http.dart' as http;

class ProductRestRepository extends ProductRepository {
  @override
  Future<List<Product>> findAllProducts(String token) async {
    var url = Uri.parse('http://10.0.2.2:8080/api/products');

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> body = json.decode(response.body);
      return body.map((dynamic item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
