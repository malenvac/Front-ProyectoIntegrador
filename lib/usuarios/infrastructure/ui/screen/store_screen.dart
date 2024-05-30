import 'package:flutter/material.dart';
import 'package:frontend_marketplus/colors.dart';
import 'package:frontend_marketplus/products/app/find_all_products.dart';
import 'package:frontend_marketplus/products/domain/model/product.dart';
import 'package:frontend_marketplus/products/infrastructure/rest/product_rest_repository.dart';
import 'package:frontend_marketplus/usuarios/domain/model/auth_response.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/widget/store_header.dart';

class StoreScreen extends StatefulWidget {
  final AuthResponse? authResponse;

  const StoreScreen({super.key, this.authResponse});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> with WidgetsBindingObserver {
  late Future<List<Product>> _eventsFuture;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadEvents();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setState(() {
        _loadEvents();
      });
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _loadEvents() {
    _eventsFuture =
        (FindAllProducts(productRepository: ProductRestRepository()))
            .run(widget.authResponse!.token);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final topPadding = screenHeight * 0.04;
    final horizontalPadding = screenWidth * 0.08;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: topPadding, left: horizontalPadding, right: horizontalPadding),
        child: Column(
          children: [
            StoreHeader(userName: widget.authResponse?.name, photoUrl: null),
            SizedBox(height: screenHeight * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Mis Productos',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: screenHeight * 0.035,
                      color: AppColors.primaryColor,
                    ))
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: FutureBuilder<List<Product>>(
                future: _eventsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else if (snapshot.hasData) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        _loadEvents();
                      },
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var event = snapshot.data![index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: EventCard(
                              onEdit: () => {},
                              onDelete: () => {},
                              product: event,
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return const Text("No events found.");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final Product product;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const EventCard({
    super.key,
    required this.product,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),  
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,  
              ),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5),  
            Text(
              '\$${product.price.value}', 
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
