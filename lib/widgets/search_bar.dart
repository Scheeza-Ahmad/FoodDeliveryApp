import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  final TextEditingController cont;
  final TextInputType type;
  final String hint;

  const Searchbar({
    super.key,
    required this.cont,
    required this.type,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: cont,
      keyboardType: type,

      style: const TextStyle(color: Colors.grey),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),

        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400),
        labelStyle: TextStyle(color: Colors.black),
        filled: true,
        fillColor: Colors.black.withOpacity(0.1),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        prefixIcon: Icon(Icons.search),
        prefixIconColor: Colors.grey[700],
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 1.2),
        ),
      ),
    );
  }
}
