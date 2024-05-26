import 'package:flutter/material.dart';
import 'package:frontend_marketplus/colors.dart';
import 'package:frontend_marketplus/usuarios/app/registrar_usuario.dart';
import 'package:frontend_marketplus/usuarios/domain/model/sign_up_request.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/widget/imput_text.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/widget/social_login_buttons.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/utils/validators.dart';

class RegisterScreen extends StatefulWidget {
  final RegistrarUsuario registrarUsuario;

  RegisterScreen({super.key, required this.registrarUsuario});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

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
        iconTheme: const IconThemeData(color: Colors.white),
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
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImputText(
              label: "Nombre de usuario",
              hintText: "Magdalena Vanegas",
              controller: _userNameController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              cursorColor: Colors.black,
              validator: Validators.validateUsername,
            ),
            ImputText(
              label: "Correo Electrónico",
              hintText: "correo@example.com",
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: Colors.black,
              validator: Validators.validateEmail,
            ),
            ImputText(
              label: 'Contraseña',
              hintText: "***********",
              controller: _passwordController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              cursorColor: Colors.black,
              validator: Validators.validatePassword,
            ),
            ImputText(
              label: 'Confirmar contraseña',
              hintText: "***********",
              controller: _confirmPasswordController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              cursorColor: Colors.black,
              validator: (value) => Validators.validateConfirmPassword(value, _passwordController.text),
            ),
            _buildRegisterButton(context),
            const SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: SocialLoginButtons(
                onFacebookPressed: () {},
                onGmailPressed: () {},
                onLinkedInPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Center(
        child: SizedBox(
          width: 218.0,
          child: OutlinedButton(
            onPressed: _isLoading ? null : () => _register(context),
            style: OutlinedButton.styleFrom(
              backgroundColor: AppColors.secondaryColor,
              foregroundColor: Colors.black,
              side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
              textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              padding: const EdgeInsets.symmetric(vertical: 16.0),
            ),
            child: _isLoading
                ? const CircularProgressIndicator()
                : const Text('Registrarse'),
          ),
        ),
      ),
    );
  }

  void _register(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      try {
        final signUpRequest = SignUpRequest(
          nombre: _userNameController.text,
          correo: _emailController.text,
          password: _passwordController.text,
        );

        final usuario = await widget.registrarUsuario.run(signUpRequest);
        setState(() => _isLoading = false);

        // Aquí puedes dirigir al usuario a otra pantalla o mostrar un mensaje de éxito.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Registro exitoso: ${usuario.nombre}")),
        );
      } catch (e) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error al registrar: ${e.toString()}")),
        );
      }
    }
  }
}
