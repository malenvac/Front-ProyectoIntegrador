import 'package:flutter/material.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/widget/product_card.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/widget/search_bar.dart'; 

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController(); 

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SearchBarP(
              controller: searchController,
              onSearch: (searchText) {
                print("Buscar: $searchText");
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PopupMenuButton<String>(
                  onSelected: (value) {
                    print("Filtro seleccionado: $value");
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: "Distancia",
                      child: Text('Distancia'),
                    ),
                    const PopupMenuItem<String>(
                      value: "Menor precio",
                      child: Text('Menor precio'),
                    ),
                    const PopupMenuItem<String>(
                      value: "Mayor precio",
                      child: Text('Mayor precio'),
                    ),
                    const PopupMenuItem<String>(
                      value: "Descuento",
                      child: Text('Descuento'),
                    ),
                  ],
                  icon: Image.asset('assets/filtro.png', width: 30, height: 30),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                ProductCard(
                  storeName: 'Tienda la Y',
                  productName: 'Papa capira',
                  price: 2500,
                  imageUrl: 'https://www.mercadoscampesinos.gov.co/wp-content/uploads/2021/04/Papa-pastusa.jpg',
                ),
                ProductCard(
                  storeName: 'Tienda de Juan',
                  productName: 'Papa capira',
                  price: 2600,
                  imageUrl: 'https://www.mercadoscampesinos.gov.co/wp-content/uploads/2021/04/Papa-pastusa.jpg',
                ),
                ProductCard(
                  storeName: 'Legumbreria J J',
                  productName: 'Papa capira',
                  price: 2700,
                  imageUrl: 'https://www.mercadoscampesinos.gov.co/wp-content/uploads/2021/04/Papa-pastusa.jpg',
                ),
                ProductCard(
                  storeName: 'Granero la bonanza',
                  productName: 'Papa capira',
                  price: 3000,
                  imageUrl: 'https://www.mercadoscampesinos.gov.co/wp-content/uploads/2021/04/Papa-pastusa.jpg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
