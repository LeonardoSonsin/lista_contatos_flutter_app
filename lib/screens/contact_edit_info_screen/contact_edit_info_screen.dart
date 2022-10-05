import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../components/contact/contact.dart';
import '../../data/contact_dao.dart';
import '../add_new_contact_screen/widgets/custom_text_form_field.dart';

class ContactEditInfoScreen extends StatefulWidget {
  const ContactEditInfoScreen(
      {Key? key,
      required this.id,
      required this.name,
      required this.phone,
      required this.email,
      required this.image})
      : super(key: key);

  final String id;
  final String name;
  final String phone;
  final String email;
  final String image;

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
  Widget build(BuildContext context) {
    return Form(
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
                const Text(
                  'Alterar Contato',
                  style: TextStyle(
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
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(50)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.name[0].toUpperCase(),
                  style: const TextStyle(
                      fontSize: 54, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          CustomTextFormField(
              textInputType: TextInputType.name,
              controller: nameController,
              formatter: MaskTextInputFormatter(mask: null),
              hintText: 'Nome'),
          CustomTextFormField(
              textInputType: TextInputType.number,
              controller: phoneController,
              formatter: MaskTextInputFormatter(mask: "(##) # #### - ####"),
              hintText: 'Telefone'),
          const SizedBox(height: 300),
        ],
      ),
    );
  }
}
