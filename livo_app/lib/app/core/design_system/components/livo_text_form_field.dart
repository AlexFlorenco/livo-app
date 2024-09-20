import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

class LivoTextFormField extends StatefulWidget {
  const LivoTextFormField({
    super.key,
    required this.controller,
    required this.prefixIcon,
    required this.label,
  });

  final TextEditingController controller;
  final Icon prefixIcon;
  final String label;

  @override
  State<LivoTextFormField> createState() => _LivoTextFormFieldState();
}

class _LivoTextFormFieldState extends State<LivoTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '${widget.label} inválido';
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        focusColor: AppColors.mainPrimaryColor,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
        prefixIcon: widget.prefixIcon,
        prefixIconColor: AppColors.darkTextColor,
        label: Text(widget.label),
        floatingLabelStyle: const TextStyle(
          color: AppColors.mainPrimaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
