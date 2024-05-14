import 'package:flutter/material.dart';
import 'package:frontend_marketplus/navigation_bar.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Center(
        child: _buildBodyContent(),
      ),

      bottomNavigationBar: CustomNavigationBar(),
      
    );
  }

  
  
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      toolbarHeight: 50,
      iconTheme: IconThemeData(color: Colors.white), 
    );
  }


  
  Widget _buildBodyContent() {
    return Text('Funcionaaa');
  }

  
}
