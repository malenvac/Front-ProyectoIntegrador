import 'package:flutter/material.dart';
import 'package:frontend_marketplus/colors.dart';
import 'package:frontend_marketplus/imput_text.dart';
import 'package:frontend_marketplus/social_login_buttons.dart';
import 'package:frontend_marketplus/services/api_service.dart';
import 'package:frontend_marketplus/utils/validators.dart';

import 'package:frontend_marketplus/register_bloc.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterBloc(apiService: ApiService(baseUrl: 'http://localhost:9090')),
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(context),
      ),
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
    final registerBloc = Provider.of<RegisterBloc>(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16.0, 40.0, 16.0, 0.0),
      child: Form(
        key: registerBloc.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImputText(
              label: "Nombre de usuario",
              hintText: "Magdalena Vanegas",
              controller: registerBloc.userNameController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              cursorColor: Colors.black,
              validator: Validators.validateUsername,
            ),
            ImputText(
              label: "Correo Electrónico",
              hintText: "correo@example.com",
              controller: registerBloc.emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: Colors.black,
              validator: Validators.validateEmail,
            ),
            ImputText(
              label: 'Contraseña',
              hintText: "***********",
              controller: registerBloc.passwordController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              cursorColor: Colors.black,
              validator: Validators.validatePassword,
            ),
            ImputText(
              label: 'Confirmar contraseña',
              hintText: "***********",
              controller: registerBloc.confirmPasswordController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              cursorColor: Colors.black,
              validator: (value) => Validators.validateConfirmPassword(value, registerBloc.passwordController.text),
            ),
            _buildRegisterButton(context, registerBloc),
            const SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: SocialLoginButtons(
                onFacebookPressed: () {
                  
                },
                onGmailPressed: () {
                  
                },
                onLinkedInPressed: () {
                  
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegisterButton(BuildContext context, RegisterBloc registerBloc) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Center(
        child: SizedBox(
          width: 218.0,
          child: OutlinedButton(
            onPressed: registerBloc.isLoading ? null : () => registerBloc.register(context),
            style: OutlinedButton.styleFrom(
              backgroundColor: AppColors.secondaryColor,
              foregroundColor: Colors.black,
              side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
              textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              padding: const EdgeInsets.symmetric(vertical: 16.0),
            ),
            child: registerBloc.isLoading
                ? const CircularProgressIndicator()
                : const Text('Registrarse'),
          ),
        ),
      ),
    );
  }
}
