import 'package:flutter/material.dart';
import 'package:frontend_marketplus/colors.dart';
import 'package:frontend_marketplus/usuarios/domain/model/auth_response.dart';
import 'package:frontend_marketplus/usuarios/infrastructure/ui/widget/store_header.dart';

class StoreScreen extends StatefulWidget {
  final AuthResponse? authResponse;

  const StoreScreen({Key? key, this.authResponse}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final topPadding = screenHeight * 0.04;
    final horizontalPadding = screenWidth * 0.08;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: topPadding, left: horizontalPadding, right: horizontalPadding),
        child: Column(
          children: [
            StoreHeader(userName: widget.authResponse?.name, photoUrl: null),
            SizedBox(height: screenHeight * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Mis Productos',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: screenHeight * 0.035,
                      color: AppColors.primaryColor,
                    )),
                IconButton(
                  icon: Icon(
                    Icons.add,
                    size: screenHeight * 0.035,
                    color: AppColors.primaryColor,
                  ),
                  onPressed: () {},
                )
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
          ],
        ),
      ),
    );
  }
}
