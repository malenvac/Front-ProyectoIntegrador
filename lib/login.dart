import 'package:flutter/material.dart';
import 'colors.dart'; 
import 'home.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                _buildCenterText('Iniciar sesión', 28),
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
    return SingleChildScrollView(  
      padding: const EdgeInsets.fromLTRB(16.0, 60.0, 16.0, 0.0),  
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection('Correo Electrónico', _buildUsernameField()),
          _buildSection('Contraseña', _buildPasswordField()),  
          _buildForgotPasswordButton(context),
          _buildLoginButton(context),
        ],
      ),
    );
  }

  Widget _buildSection(String title, Widget field) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title, 
          style: const TextStyle(
            fontSize: 14.0,
            color: AppColors.colorText2,
          ),
        ),
        const SizedBox(height: 0.0),  
        field,
      ],
    );
  }

 Widget _buildUsernameField() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 24.0),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: 'correo@example.com',  
        fillColor: AppColors.secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      ),
    ),
  );
}


Widget _buildPasswordField() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 0.0),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: '*****************',  
        fillColor: AppColors.secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      ),
    ),
  );
}
 Widget _buildForgotPasswordButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 16, 0), // left, top, right, bottom
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {
           
            print("Recuperación de contraseña solicitada.");
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            foregroundColor: AppColors.black,  
          ),
          child: const Text(
            'Olvidaste tu contraseña',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0,
            decoration: TextDecoration.underline
            ),
          ),
        ),
      ),
    );
  }



  Widget _buildLoginButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 40.0),
    child: Center(  
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
          child: const Text('Iniciar sesión'),
        ),
      ),
    ),
  );
}

}
