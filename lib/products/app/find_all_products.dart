import 'package:frontend_marketplus/products/domain/model/product.dart';
import 'package:frontend_marketplus/products/domain/repository/product_repository.dart';

class FindAllProducts {
  final ProductRepository productRepository;

  FindAllProducts({required this.productRepository});

  Future<List<Product>> run(String token) async {
    return await productRepository.findAllProducts(token);
  }
}
