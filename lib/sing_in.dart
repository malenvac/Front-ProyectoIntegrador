import 'package:flutter/material.dart';
import 'colors.dart';  
import 'home.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                _buildCenterText('Registrarse', 28),
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
    return const Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Text('Registrarse',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildUsernameField(),
          _buildLoginButton(context),
        ],
      ),
    );
  }

  Widget _buildUsernameField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: const InputDecoration(
          labelText: 'Usuario',
          border: OutlineInputBorder(),
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
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen())),
          style: OutlinedButton.styleFrom(
            backgroundColor: AppColors.secondaryColor,
            foregroundColor: Colors.black,
            side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
          child: const Text('Registrarse'),
        ),
      ),
    );
  }
}
