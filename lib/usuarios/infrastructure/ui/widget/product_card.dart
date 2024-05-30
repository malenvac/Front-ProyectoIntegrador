import 'package:flutter/material.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/screen/product_detail.dart';
import 'package:intl/intl.dart';
import 'package:frontend_marketplus/colors.dart';

class ProductCard extends StatelessWidget {
  final String storeName;
  final String productName;
  final double price;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.storeName,
    required this.productName,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final NumberFormat formatter = NumberFormat.currency(
      locale: 'es_CO',
      symbol: '', 
      decimalDigits: 0,
    );

    String formattedPrice = '\$${formatter.format(price).trim()}';

    return Container(
      height: 134,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(left: Radius.circular(8)),
            child: Image.network(
              imageUrl,
              width: MediaQuery.of(context).size.width * 0.3,
              height: 134,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center, 
                    child: Text(
                      storeName,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    productName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '$formattedPrice LB',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 4), 
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(
                                productName: productName,
                                price: price,
                                imageUrl: imageUrl,
                                storeName: storeName,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: AppColors.primaryColor,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text('Comprar'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
