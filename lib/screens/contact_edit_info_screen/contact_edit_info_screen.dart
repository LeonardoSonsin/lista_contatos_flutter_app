import 'package:flutter/material.dart';
import 'package:lista_contatos_flutter_app/components/contact/contact_avatar.dart';
import 'package:lista_contatos_flutter_app/themes/my_colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../components/contact/contact.dart';
import '../../data/contact_dao.dart';

class ContactEditInfoScreen extends StatefulWidget {
  const ContactEditInfoScreen(
      {Key? key,
      required this.id,
      required this.name,
      required this.phone,
      required this.email,
      required this.image,
      required this.favorite})
      : super(key: key);

  final String id;
  final String name;
  final String phone;
  final String email;
  final String image;
  final String favorite;

  @override
  State<ContactEditInfoScreen> createState() => _ContactEditInfoScreenState();
}

class _ContactEditInfoScreenState extends State<ContactEditInfoScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
    phoneController.text = widget.phone;
    emailController.text = widget.email;
    imageController.text = widget.image;
  }

  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
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
                      style: TextStyle(
                          decoration: TextDecoration.underline, fontSize: 14),
                    ),
                  ),
                  Text(
                    'Alterar Contato',
                    style: TextStyle(
                      color: MyColors().white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ContactDao().update(
                          Contact(
                            id: widget.id,
                            name: nameController.text,
                            phone: phoneController.text,
                            email: emailController.text,
                            image: imageController.text,
                            favorite: widget.favorite,
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text(
                      'Salvar',
                      style: TextStyle(
                          decoration: TextDecoration.underline, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ContactAvatar(
                  name: nameController.text.isNotEmpty
                      ? nameController.text
                      : ' ',
                  image: imageController.text.isNotEmpty
                      ? imageController.text
                      : ' ',
                  size: 60,
                  fontSize: 100),
            ),
            buildTextFormField(TextInputType.name, nameController,
                MaskTextInputFormatter(mask: null), 'Nome'),
            buildTextFormField(TextInputType.number, phoneController,
                MaskTextInputFormatter(mask: "(##) # ####-####"), 'Telefone'),
            buildTextFormField(TextInputType.emailAddress, emailController,
                MaskTextInputFormatter(mask: null), 'E-mail'),
            buildTextFormField(TextInputType.url, imageController,
                MaskTextInputFormatter(mask: null), 'Imagem'),
          ],
        ),
      ),
    );
  }

  TextFormField buildTextFormField(
      TextInputType textInputType,
      TextEditingController controller,
      MaskTextInputFormatter formatter,
      String hintText) {
    return TextFormField(
      style: TextStyle(color: MyColors().white),
      keyboardType: textInputType,
      controller: controller,
      inputFormatters: [formatter],
      onChanged: hintText == 'Nome' || hintText == 'Imagem'
          ? (text) => setState(() {})
          : null,
      decoration: InputDecoration(hintText: hintText, filled: true, hintStyle: TextStyle(color: MyColors().greyText)),
      validator: (String? value) {
        if (valueValidator(value)) {
          return 'Campo Obrigatório!';
        }
        return null;
      },
    );
  }
}
