import 'package:flutter/material.dart';
import '../../../shared/colors/app_colors.dart';

class MyTextFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool focus;
  final bool obscureText;

  const MyTextFormField(
      {super.key,
      required this.labelText,
      required this.controller,
      this.focus = false,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          label: Text(labelText),
          labelStyle: const TextStyle(color: AppColors.secondaryText),
          fillColor: AppColors.inputBackground,
          filled: true,
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.logo)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.inputBorder))),
      enabled: true,
      style: const TextStyle(color: AppColors.mainText),
      controller: controller,
      textAlign: TextAlign.start,
      autofocus: false,
      keyboardType: TextInputType.text,
      obscureText: obscureText,
    );
  }
}
