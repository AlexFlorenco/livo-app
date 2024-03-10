import 'package:flutter/material.dart';

import '../shared/constants/livo_colors.dart';

class LivoEmailFormField extends StatefulWidget {
  const LivoEmailFormField({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  State<LivoEmailFormField> createState() => _LivoEmailFormFieldState();
}

class _LivoEmailFormFieldState extends State<LivoEmailFormField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 65,
      child: TextFormField(
        cursorHeight: 15,
        controller: widget.controller,
        validator: (email) {
          if (email == null ||
              email.isEmpty ||
              email.length < 5 ||
              !email.contains('@') ||
              !email.contains('.')) {
            return 'E-mail inválido';
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          helperText: '',
          focusColor: LivoColors.mainPrimaryColor,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
          prefixIcon: const Icon(Icons.alternate_email),
          prefixIconColor: LivoColors.darkTextColor,
          label: const Text(
            'E-mail',
            style: TextStyle(fontSize: 16),
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
