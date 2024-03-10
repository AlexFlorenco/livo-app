import 'package:flutter/material.dart';

import '../shared/constants/livo_colors.dart';

class LivoPasswordFormField extends StatefulWidget {
  const LivoPasswordFormField({
    super.key,
    required this.controller,
    this.isConfirmation = false,
  });
  final TextEditingController controller;
  final bool isConfirmation;

  @override
  State<LivoPasswordFormField> createState() => _LivoPasswordFormFieldState();
}

class _LivoPasswordFormFieldState extends State<LivoPasswordFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 65,
      child: TextFormField(
        cursorHeight: 15,
        controller: widget.controller,
        validator: (password) {
          if (password == null || password.isEmpty || password.length < 6) {
            return 'Senha inválida';
          }
          return null;
        },
        obscureText: _obscureText,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          helperText: '',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
          prefixIcon: const Icon(
            Icons.lock_outlined,
            color: LivoColors.darkTextColor,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            icon: _obscureText
                ? const Icon(Icons.visibility_outlined)
                : const Icon(Icons.visibility_off_outlined),
          ),
          label: Text(
            widget.isConfirmation ? 'Confirmação de senha' : 'Senha',
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
