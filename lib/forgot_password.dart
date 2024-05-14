import 'package:flutter/material.dart';
import 'colors.dart'; 
import 'imput_text.dart';
import 'home.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
        iconTheme: IconThemeData(color: Colors.white), 
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
                _buildCenterText('Recuperar contraseña', 28),
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
      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 0.0),  
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
         children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 40.0),  
            child: Text(
              'Ingresa el correo electrónico para recuperar tu contraseña',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ImputText(
          label: "Correo Electrónico",
          hintText: "correo@example.com",
          controller: emailController, // Asegúrate de definir este controlador en tu clase
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
        ),
         
          
          _buildLoginButton(context),
      ],
      ),
    );
  }

 



  Widget _buildLoginButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 40.0),
    child: Center(  
      child: SizedBox(
        width: 250.0,
        child: OutlinedButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen())),
          style: OutlinedButton.styleFrom(
            backgroundColor: AppColors.secondaryColor,
            foregroundColor: Colors.black,
            side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
          child: const Text('Recuperar contraseña'),
        ),
      ),
    ),
  );
}

}
