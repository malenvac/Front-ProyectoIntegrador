import 'package:flutter/material.dart';
import 'colors.dart'; 
import 'imput_text.dart';
import 'home.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController comfirmPasswordController = TextEditingController();

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
      padding: const EdgeInsets.fromLTRB(16.0, 40.0, 16.0, 0.0),  
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
         children: [
        ImputText(
          label: "Nombre de usuario",
          hintText: "Magdalena Vanegas",
          controller: userNameController, // Asegúrate de definir este controlador en tu clase
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          cursorColor: Colors.black,
        ),
        ImputText(
          label: "Correo Electrónico",
          hintText: "correo@example.com",
          controller: emailController, // Asegúrate de definir este controlador en tu clase
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          cursorColor: Colors.black,
        ),

          ImputText(
            label: 'Contraseña',
            hintText: "***********",
            controller: passwordController,
            obscureText: true, // Ensure text is obscured for passwords
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            cursorColor: Colors.black,
          ),
           ImputText(
            label: 'Confirmar contraseña',
            hintText: "***********",
            controller: comfirmPasswordController,
            obscureText: true, // Ensure text is obscured for passwords
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            cursorColor: Colors.black,
          ),
          
          _buildLoginButton(context),
      ],
      ),
    );
  }

 



  Widget _buildLoginButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
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
          child: const Text('Registrarse'),
        ),
      ),
    ),
  );
}

}
