import 'package:flutter/material.dart';
import 'package:lista_contatos_flutter_app/screens/add_new_contact_screen/widgets/custom_text_form_field.dart';
import 'package:lista_contatos_flutter_app/screens/add_new_contact_screen/components/new_contact_appbar.dart';
import 'package:lista_contatos_flutter_app/screens/add_new_contact_screen/components/new_contact_image.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NewContactScreen extends StatefulWidget {
  const NewContactScreen({Key? key}) : super(key: key);

  @override
  State<NewContactScreen> createState() => _NewContactScreenState();
}

class _NewContactScreenState extends State<NewContactScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

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
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NewContactAppBar(
            formKey: _formKey,
            nameController: nameController,
            phoneController: phoneController,
          ),
          const NewContactImage(),
          CustomTextFormField(
              textInputType: TextInputType.name,
              controller: nameController,
              formatter: MaskTextInputFormatter(mask: null),
              hintText: 'Nome'),
          CustomTextFormField(
              textInputType: TextInputType.number,
              controller: phoneController,
              formatter: MaskTextInputFormatter(mask: "(##) # ####-####"),
              hintText: 'Telefone'),
          const SizedBox(height: 300),
        ],
      ),
    );
  }
}
