import 'package:flutter/material.dart';
import 'package:lista_contatos_flutter_app/screens/contact_edit_info_screen/contact_edit_info_screen.dart';
import 'package:lista_contatos_flutter_app/screens/contact_info_screen/components/contact_info_icons.dart';
import 'package:lista_contatos_flutter_app/screens/contact_info_screen/components/contact_info_image.dart';
import 'package:lista_contatos_flutter_app/screens/contact_info_screen/components/contact_info_name.dart';
import 'package:lista_contatos_flutter_app/screens/contact_info_screen/components/contact_info_phone_email.dart';

class ContactInfoScreen extends StatefulWidget {
  const ContactInfoScreen(
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
  State<ContactInfoScreen> createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  context: context,
                  builder: (context) => ContactEditInfoScreen(
                    id: widget.id,
                    name: widget.name,
                    phone: widget.phone,
                    email: widget.email,
                    image: widget.image,
                  ),
                ).then((value) => setState(() {}));
              },
              icon: const Icon(Icons.edit))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ContactInfoImage(name: widget.name, image: widget.image),
          ContactInfoName(name: widget.name),
          ContactInfoIcons(phone: widget.phone),
          ContactInfoPhoneEmail(info: widget.phone, text: 'Telefone'),
          ContactInfoPhoneEmail(info: widget.email, text: 'Email'),
        ],
      ),
    );
  }
}
