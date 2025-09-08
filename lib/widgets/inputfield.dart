import 'package:flutter/material.dart';

class Inputfield extends StatelessWidget {
  final TextEditingController cont;
  final TextInputType type;
  final String hint;
  final bool option;
  final IconData icon;
  const Inputfield({
    super.key,
    required this.cont,
    required this.type,
    required this.hint,
    required this.option,
    this.icon = Icons.visibility_off,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: cont,
      keyboardType: type,
      obscureText: option,

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
        suffixIcon: option ? Icon(icon) : null,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 1.2),
        ),
      ),
    );
  }
}
