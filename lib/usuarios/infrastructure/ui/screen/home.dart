import 'package:flutter/material.dart';
import 'package:frontend_marketplus/usuarios/domain/model/auth_response.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/screen/delivery_screen.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/screen/offers_screen.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/screen/products_scrren.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/screen/profile_screen.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/screen/store_screen.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/widget/search_bar.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/widget/product_card.dart';

class HomeScreen extends StatefulWidget {
  final AuthResponse? user;

  static const String routeName = "HomeScreen";

  const HomeScreen({super.key, this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final TextEditingController searchController = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    final screens = [
      const OffersScreen(),
      StoreScreen(authResponse: widget.user),
      const ProfileScreen(),      
      ProductsScreen(),
      
    ];

    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
         
          
         
          Expanded(
            child: IndexedStack(
              index: selectedIndex,
              children: screens,
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      toolbarHeight: 50,
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      selectedItemColor: Colors.black,
      items: const [
        
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icono_home.png')),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icono_tienda.png')),
          label: 'Mi tienda',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icono_usuario.png')),
          label: 'Perfil',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icono_carrito.png')),
          label: 'Pedidos',
        ),
      ],
    );
  }
}
