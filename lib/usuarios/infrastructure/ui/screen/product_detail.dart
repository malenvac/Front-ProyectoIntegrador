import 'package:flutter/material.dart';
import 'package:frontend_marketplus/colors.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productName;
  final double price;
  final String imageUrl;
  final String storeName;

  const ProductDetailScreen({
    super.key,
    required this.productName,
    required this.price,
    required this.imageUrl,
    required this.storeName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        toolbarHeight: 50,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16), 
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    storeName,
                    style: const TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 6 , 16, 16),  
                child: Center(
                  child: Image.network(
                    imageUrl,
                    width: MediaQuery.of(context).size.width, 
                    height: 250, 
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Text(
                  productName,
                  style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Text(
                  "Papa capira gruesa fresca",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Precio "+ '\$${price.toString()} LB',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.primaryColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 52, 16, 16),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      print("Acción de comprar ahora");
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: AppColors.primaryColor,
                      shape: StadiumBorder(),
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    ),
                    child: const Text(
                      'Comprar Ahora',
                      style: TextStyle(fontSize: 20),  
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
