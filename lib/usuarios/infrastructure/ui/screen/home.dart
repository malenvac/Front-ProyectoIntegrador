import 'package:flutter/material.dart';
import 'package:frontend_marketplus/usuarios/domain/model/auth_response.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/screen/delivery_screen.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/screen/offers_screen.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/screen/profile_screen.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/screen/store_screen.dart';

class HomeScreen extends StatefulWidget {
  final AuthResponse? user;

  static const String routeName = "HomeScreen";

  const HomeScreen({super.key, this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      const StoreScreen(),
      const OffersScreen(),
      const ProfileScreen(),
      const DeliveryScreen(),
    ];

    return Scaffold(
      appBar: _buildAppBar(context),
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icono_tienda.png')),
            label: 'Mi tienda',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icono_home.png')),
            label: 'Inicio',
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
      ),
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
}
