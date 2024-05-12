import 'package:flutter/material.dart';
import 'colors.dart';
import 'login.dart';
import 'sing_in.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(150.0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: ClipRRect(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(120),
              ),
            ),
            child: Stack(
              children: [
                _buildLeftImage(),
                _buildCenterText('Bienvenido', 28),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLeftImage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 100),
        child: Image.asset(
          'assets/carrito_compras.png',
          width: 50,
          height: 50,
        ),
      ),
    );
  }

  Widget _buildCenterText(String text, double fontSize) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 60.0, 16.0, 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Tiendas locales al alcance de tu mano',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          _buildRegisterButton(context),
          _buildLoginButton(context),
        ],
      ),
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0),
      child: SizedBox(
        width: 218.0,
        child: OutlinedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RegisterScreen()),
            );
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: AppColors.secondaryColor,
            foregroundColor: Colors.black,
            side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
          child: const Text('Registrarse'),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: SizedBox(
        width: 218.0,
        child: OutlinedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: AppColors.secondaryColor,
            foregroundColor: Colors.black,
            side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
          child: const Text('Iniciar sesión'),
        ),
      ),
    );
  }
}
