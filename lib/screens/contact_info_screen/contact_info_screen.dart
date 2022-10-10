import 'package:flutter/material.dart';
import 'package:lista_contatos_flutter_app/components/contact/contact.dart';
import 'package:lista_contatos_flutter_app/data/contact_dao.dart';
import 'package:lista_contatos_flutter_app/screens/contact_edit_info_screen/contact_edit_info_screen.dart';
import 'package:lista_contatos_flutter_app/screens/contact_info_screen/components/contact_info_icons.dart';
import 'package:lista_contatos_flutter_app/components/contact/contact_avatar.dart';
import 'package:lista_contatos_flutter_app/screens/contact_info_screen/components/contact_info_name.dart';
import 'package:lista_contatos_flutter_app/screens/contact_info_screen/components/contact_info_email.dart';

class ContactInfoScreen extends StatefulWidget {
  const ContactInfoScreen(
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
  State<ContactInfoScreen> createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  favoriteContact() {
    if (isFavorite()) {
      ContactDao().update(Contact(
          id: widget.id,
          name: widget.name,
          phone: widget.phone,
          email: widget.email,
          image: widget.image,
          favorite: 'false'));
    } else if (!isFavorite()) {
      ContactDao().update(Contact(
          id: widget.id,
          name: widget.name,
          phone: widget.phone,
          email: widget.email,
          image: widget.image,
          favorite: 'true'));
    }
  }

  isFavorite() {
    if (widget.favorite == 'true') {
      return true;
    } else if (widget.favorite == 'false') {
      return false;
    }
  }

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
                builder: (newContext) => ContactEditInfoScreen(
                  id: widget.id,
                  name: widget.name,
                  phone: widget.phone,
                  email: widget.email,
                  image: widget.image,
                  favorite: widget.favorite,
                ),
              ).then((value) => setState(() {}));
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              favoriteContact();
            },
            icon: Icon(isFavorite() ? Icons.favorite : Icons.favorite_border),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ContactAvatar(
                name: widget.name,
                image: widget.image,
                size: 60,
                fontSize: 100),
          ),
          ContactInfoNamePhone(name: widget.name, phone: widget.phone),
          ContactInfoIcons(phone: widget.phone),
          ContactInfoEmail(info: widget.email, text: 'Email'),
        ],
      ),
    );
  }
}
