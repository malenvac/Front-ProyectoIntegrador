import 'package:flutter/material.dart';
import '../widget/search_bar.dart';
import '../widget/navigation_bar.dart'; 

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBodyContent(context),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      toolbarHeight: 50,
      iconTheme: const IconThemeData(color: Colors.white), 
    );
  }

  Widget _buildBodyContent(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SearchBarP(
            controller: TextEditingController(),
            onSearch: (value) {
             
              print("Buscar: $value");
            },
          ),
        ),
        const Expanded(
          child: Center(
            child: Text('Funcionaaa'),
          ),
        ),
      ],
    );
  }
}
