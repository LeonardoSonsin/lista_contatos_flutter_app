import 'package:flutter/material.dart';
import 'package:lista_contatos_flutter_app/themes/my_colors.dart';
import 'package:uuid/uuid.dart';

import '../../../components/contact/contact.dart';
import '../../../data/contact_dao.dart';

class NewContactAppBar extends StatelessWidget {
  const NewContactAppBar(
      {Key? key,
      required this.formKey,
      required this.nameController,
      required this.phoneController,
      required this.emailController,
      required this.imageController})
      : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController imageController;
  final uuid = const Uuid();

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
          Text(
            'Novo Contato',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: MyColors().white),
          ),
          TextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                ContactDao().create(
                  Contact(
                    id: uuid.v1(),
                    name: nameController.text,
                    phone: phoneController.text,
                    email: emailController.text,
                    image: imageController.text,
                    favorite: 'false',
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
