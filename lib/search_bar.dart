import 'package:flutter/material.dart';
import 'colors.dart';

class SearchBarP extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSearch;

  const SearchBarP({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor, 
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.primaryColor, width: 2), 
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Buscar ...',
          hintStyle: const TextStyle(
            color: AppColors.colorText2,
            fontSize: 16.0, 
          ), 
          border: InputBorder.none, 
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10.0), 
            child: Image.asset(
              'assets/search.png',
              width: 20,
              height: 20,
            ),
          ), 
          contentPadding: const EdgeInsets.symmetric(vertical: 12.0), 
        ),
        onSubmitted: onSearch, 
      ),
    );
  }
}
