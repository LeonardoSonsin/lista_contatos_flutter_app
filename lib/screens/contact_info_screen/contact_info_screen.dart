import 'package:flutter/material.dart';
import 'package:lista_contatos_flutter_app/screens/contact_edit_info_screen/contact_edit_info_screen.dart';
import 'package:lista_contatos_flutter_app/screens/contact_info_screen/components/contact_info_icons.dart';
import 'package:lista_contatos_flutter_app/screens/contact_info_screen/components/contact_info_image.dart';
import 'package:lista_contatos_flutter_app/screens/contact_info_screen/components/contact_info_name.dart';
import 'package:lista_contatos_flutter_app/screens/contact_info_screen/components/contact_info_phone.dart';

class ContactInfoScreen extends StatefulWidget {
  const ContactInfoScreen({Key? key, required this.name, required this.phone})
      : super(key: key);

  final String name;
  final String phone;

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
                  builder: (context) => ContactEditInfoScreen(name: widget.name, phone: widget.phone,),
                ).then((value) => setState(() {}));
              },
              icon: const Icon(Icons.edit))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ContactInfoImage(name: widget.name),
          ContactInfoName(name: widget.name),
          const ContactInfoIcons(),
          ContactInfoPhone(phone: widget.phone),
        ],
      ),
    );
  }
}
