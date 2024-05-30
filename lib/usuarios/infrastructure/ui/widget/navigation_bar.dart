import 'package:flutter/material.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/screen/delivery_screen.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/screen/home.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/screen/products_scrren.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/screen/profile_screen.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/screen/store_screen.dart';


class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int selectedIndex = 0;

  
  final screens = [
    StoreScreen(), 
    HomeScreen(),   
    ProfileScreen(), 
    ProductsScreen(), 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
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
    );
  }
}

