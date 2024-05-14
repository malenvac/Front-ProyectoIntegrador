import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _selectedIndex = 0; 

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex, 
      onTap: _onItemTapped,
      selectedItemColor: Colors.black,
      items: const <BottomNavigationBarItem>[
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
    );
  }
}
