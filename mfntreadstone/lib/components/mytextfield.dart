import 'package:flutter/material.dart';

class Mytextfield extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const Mytextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,

    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 228, 44, 27)),
          ),
          fillColor: const Color.fromARGB(255, 232, 232, 232),
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(color: Color.fromARGB(255, 158, 158, 158))
        ),
      ),
    );
  }
}
