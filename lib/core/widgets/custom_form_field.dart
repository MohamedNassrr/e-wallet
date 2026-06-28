import 'package:e_wallet/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.controller,
    required this.inputType,
    this.validate,
    this.onSubmit,
    required this.hintText,
    required this.prefixIcon,
  });

  final TextEditingController controller;
  final TextInputType inputType;
  final FormFieldValidator<String>? validate;
  final Function(String)? onSubmit;
  final String hintText;
  final IconData prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      validator: validate,
      onFieldSubmitted: onSubmit,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.grey400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.grey400),
        ),
        prefixIcon: Icon(prefixIcon, color: AppColors.grey400),
        hintText: hintText,
      ),
    );
  }
}
