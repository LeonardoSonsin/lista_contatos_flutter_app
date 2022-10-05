import 'package:flutter/material.dart';
import 'package:lista_contatos_flutter_app/screens/contact_info_screen/contact_info_screen.dart';

import 'delete_contact.dart';

class Contact extends StatefulWidget {
  const Contact(
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
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage:
            widget.image.isNotEmpty ? NetworkImage(widget.image) : null,
        backgroundColor: Colors.white,
        child: widget.image.isEmpty
            ? Text(
                widget.name[0].toUpperCase(),
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )
            : null,
      ),
      title: Text(widget.name),
      subtitle: Text(widget.phone),
      trailing: null,
      /*IconButton(
        padding: const EdgeInsets.all(0.0),
        color: Colors.red,
        icon: const Icon(Icons.favorite),
        onPressed: () {},
      ),*/
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (builder) => ContactInfoScreen(
              id: widget.id,
              name: widget.name,
              phone: widget.phone,
              email: widget.email,
              image: widget.image,
            ),
          ),
        );
      },
      onLongPress: () {
        deleteContact(context, widget.id, widget.name);
      },
    );
  }
}
