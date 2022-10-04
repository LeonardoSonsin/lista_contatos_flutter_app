import 'package:flutter/material.dart';

import '../../../components/contact/contact.dart';
import '../../../data/contact_dao.dart';

class NewContactAppBar extends StatelessWidget {
  const NewContactAppBar(
      {Key? key,
      required this.formKey,
      required this.nameController,
      required this.phoneController})
      : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancelar',
              style:
                  TextStyle(decoration: TextDecoration.underline, fontSize: 14),
            ),
          ),
          const Text(
            'Novo Contato',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          TextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                ContactDao().save(
                  Contact(
                    name: nameController.text,
                    phone: phoneController.text,
                  ),
                );
                Navigator.pop(context);
              }
            },
            child: const Text(
              'Salvar',
              style:
                  TextStyle(decoration: TextDecoration.underline, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
