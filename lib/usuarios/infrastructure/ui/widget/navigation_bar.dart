import 'package:flutter/material.dart';
import 'package:frontend_marketplus/usuarios/domain/model/user.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/screen/delivery_screen.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/screen/home.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/screen/profile_screen.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/screen/store_screen.dart';

class CustomNavigationBar extends StatefulWidget {
  final User? user;

  const CustomNavigationBar({Key? key, this.user}) : super(key: key);

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(user: widget.user),
      const ProfileScreen(),
      const StoreScreen(),
      const DeliveryScreen(),
    ];

    return Scaffold(
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
            icon: ImageIcon(AssetImage('assets/icono_home.png')),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icono_usuario.png')),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icono_tienda.png')),
            label: 'Mi tienda',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icono_carrito.png')),
            label: 'Pedidos',
          ),
        ],
      ),
    );
  }
}
