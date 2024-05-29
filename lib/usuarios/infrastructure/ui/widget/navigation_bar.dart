import 'package:flutter/material.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/screen/delivery_screen.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/screen/home.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/screen/profile_screen.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/screen/store_screen.dart';

class CustomNavigationBar extends StatefulWidget {

  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(),
      const ProfileScreen(),
      const StoreScreen(),
      const DeliveryScreen(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
    );
  }
}
