import 'package:flutter/material.dart';

import '../shared/constants/livo_colors.dart';

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
    return SizedBox(
      width: 250,
      height: 65,
      child: TextFormField(
        cursorHeight: 15,
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
          helperText: '',
          focusColor: LivoColors.mainPrimaryColor,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
          prefixIconColor: LivoColors.darkTextColor,
          prefixIcon: widget.prefixIcon,
          label: Text(
            widget.label,
            style: const TextStyle(fontSize: 16),
          ),
          floatingLabelStyle: const TextStyle(
            color: LivoColors.mainPrimaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
