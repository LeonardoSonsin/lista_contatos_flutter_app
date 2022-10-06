import 'package:flutter/material.dart';
import 'package:lista_contatos_flutter_app/components/contact/contact_avatar.dart';
import 'package:lista_contatos_flutter_app/screens/add_new_contact_screen/components/new_contact_appbar.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NewContactScreen extends StatefulWidget {
  const NewContactScreen({Key? key}) : super(key: key);

  @override
  State<NewContactScreen> createState() => _NewContactScreenState();
}

class _NewContactScreenState extends State<NewContactScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController imageController = TextEditingController();

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NewContactAppBar(
              formKey: _formKey,
              nameController: nameController,
              phoneController: phoneController,
              emailController: emailController,
              imageController: imageController,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ContactAvatar(
                  name:
                      nameController.text.isNotEmpty ? nameController.text : ' ',
                  image: imageController.text.isNotEmpty
                      ? imageController.text
                      : ' ',
                  size: 60,
                  fontSize: 54),
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
      keyboardType: textInputType,
      controller: controller,
      inputFormatters: [formatter],
      onChanged: hintText == 'Nome' || hintText == 'Imagem'
          ? (text) => setState(() {})
          : null,
      decoration: InputDecoration(hintText: hintText, filled: true),
      validator: (String? value) {
        if (valueValidator(value)) {
          return 'Campo Obrigatório!';
        }
        return null;
      },
    );
  }
}
