import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      required this.textInputType,
      required this.controller,
      required this.formatter,
      required this.hintText})
      : super(key: key);

  final TextInputType textInputType;
  final TextEditingController controller;
  final MaskTextInputFormatter formatter;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      inputFormatters: [formatter],
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
      ),
      validator: (String? value) {
        if (valueValidator(value)) {
          return 'Campo Obrigatório!';
        }
        return null;
      },
    );
  }
}

bool valueValidator(String? value) {
  if (value != null && value.isEmpty) {
    return true;
  }
  return false;
}
