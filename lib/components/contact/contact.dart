import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:lista_contatos_flutter_app/screens/contact_info_screen/contact_info_screen.dart';

import 'delete_contact.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key, required this.id, required this.name, required this.phone})
      : super(key: key);

  final String id;
  final String name;
  final String phone;

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor:
            Colors.primaries[math.Random().nextInt(Colors.primaries.length)],
        child: Text(
          widget.name[0].toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      title: Text(widget.name),
      subtitle: Text(widget.phone),
      trailing: null,/*IconButton(
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
            ),
          ),
        );
      },
      onLongPress: () {
        deleteContact(context, widget.name);
      },
    );
  }
}
