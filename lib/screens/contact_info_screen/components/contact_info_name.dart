import 'package:flutter/material.dart';

class ContactInfoName extends StatelessWidget {
  const ContactInfoName({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 18.0),
      child: Text(
        name,
        style: const TextStyle(fontSize: 40),
      ),
    );
  }
}
