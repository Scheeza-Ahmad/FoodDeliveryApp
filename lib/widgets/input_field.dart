import 'package:flutter/material.dart';

class Inputfield extends StatefulWidget {
  

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
  State<Inputfield> createState() => _InputfieldState();
}

class _InputfieldState extends State<Inputfield> {
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
    return TextField(
      focusNode: _focusNode,
      controller: widget.cont,
      keyboardType: widget.type,
      obscureText: widget.option,
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
        suffixIcon: widget.option ? Icon(widget.icon) : null,
      ),
    );
  }
}
