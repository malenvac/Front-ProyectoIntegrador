import 'package:flutter/material.dart';
import 'package:frontend_marketplus/colors.dart';

class StoreHeader extends StatelessWidget {
  final String? userName;
  final String? photoUrl;

  const StoreHeader({super.key, this.userName, this.photoUrl});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hola \n${userName ?? "Usuario"} 👋',
                    style: TextStyle(
                        fontSize: screenHeight * 0.02,
                        fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  GestureDetector(
                    onTap: () async {
                      ;
                    },
                    child: Text(
                      "Bienvendo a tu tienda!",
                      style: TextStyle(
                        fontSize: screenHeight * 0.02,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            photoUrl != null || photoUrl == ""
                ? ClipOval(
                    child: Image.network(
                      photoUrl!,
                      height: screenHeight * 0.055,
                      fit: BoxFit.cover,
                    ),
                  )
                : ClipOval(
                    child: Image.network(
                      "https://placehold.jp/150x150.png",
                      height: screenHeight * 0.055,
                      fit: BoxFit.cover,
                    ),
                  )
          ],
        ),
      ],
    );
  }
}
