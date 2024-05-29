
import 'package:frontend_marketplus/products/domain/model/product.dart';

abstract class ProductRepository {
  Future<List<Product>> findAllProducts(String token);
}
