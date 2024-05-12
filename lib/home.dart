import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Center(
        child: _buildBodyContent(),
      ),
    );
  }

  
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      toolbarHeight: 50,
    );
  }

  
  Widget _buildBodyContent() {
    return Text('Contenido del cuerpo');
  }
}
