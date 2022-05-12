import 'package:chattie/utils/constants.dart';
import 'package:flutter/material.dart';

class BaseInput extends StatelessWidget {
  const BaseInput(
      {Key? key,
      required this.labelText,
      required this.controller,
      this.isObscureText = false,
      this.onTap})
      : super(key: key);
  final String labelText;
  final TextEditingController controller;
  final bool isObscureText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF5F5F5),
      ),
      child: TextField(
        controller: controller,
        onTap: onTap,
        cursorColor: greyTextColor,
        obscureText: isObscureText,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(fontSize: calloutTextSize),
          floatingLabelStyle: const TextStyle(color: primaryColor),
          contentPadding: const EdgeInsets.all(12),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFC9C9C9),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
        ),
      ),
    );
  }
}
