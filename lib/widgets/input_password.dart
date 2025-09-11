import 'package:flutter/material.dart';
import 'package:food/controller/eye_controller.dart';
import 'package:get/get.dart';

class InputPassword extends StatelessWidget {
  final TextEditingController cont;
  final TextInputType type;
  final String hint;
  final EyeController controller;

  const InputPassword({
    super.key,
    required this.cont,
    required this.type,
    required this.hint,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        controller: cont,
        keyboardType: type,
        obscureText: controller.obsecuretext.value,
        style: const TextStyle(color: Colors.grey),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade400),
          labelStyle: const TextStyle(color: Colors.black),
          filled: true,
          fillColor: Colors.black.withOpacity(0.1),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              controller.obsecuretext.value
                  ? Icons.visibility_off
                  : Icons.visibility,
            ),
            onPressed: () {
              controller.toogle();
            },
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.red, width: 1.2),
          ),
        ),
      ),
    );
  }
}
