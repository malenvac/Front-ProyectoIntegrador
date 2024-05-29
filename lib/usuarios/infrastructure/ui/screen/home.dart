import 'package:flutter/material.dart';
import 'package:frontend_marketplus/usuarios/domain/model/user.dart';
import '../widget/search_bar.dart';
import '../widget/navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  final User? user;

  static const String routeName = "HomeScreen";

  const HomeScreen({super.key, this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBodyContent(context),
      bottomNavigationBar: CustomNavigationBar(user: widget.user),
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
        Expanded(
          child: Center(
            child: Column(
              children: [
                Text('Funcionaaa'),
                Text("name: ${widget.user!.name}"),
                Text("email: ${widget.user!.email}"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
