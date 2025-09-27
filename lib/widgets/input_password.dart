import 'package:flutter/material.dart';
import 'package:food/controller/eye_controller.dart';
import 'package:get/get.dart';

class InputPassword extends StatefulWidget {
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
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        focusNode: _focusNode,
        controller: widget.cont,
        keyboardType: widget.type,
        obscureText: widget.controller.obsecuretext.value,
        style: const TextStyle(color: Colors.grey),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: _isFocused
                ? const BorderSide(color: Colors.blue, width: 1.2)
                : BorderSide.none,
          ),
          hintText: widget.hint,
          hintStyle: TextStyle(color: Colors.grey.shade400),
          filled: true,
          fillColor: Colors.black.withOpacity(0.1),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              widget.controller.obsecuretext.value
                  ? Icons.visibility_off
                  : Icons.visibility,
            ),
            onPressed: () {
              widget.controller.toogle();
            },
          ),
        ),
      ),
    );
  }
}
