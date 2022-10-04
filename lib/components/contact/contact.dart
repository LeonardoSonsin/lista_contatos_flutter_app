import 'package:flutter/material.dart';
import 'package:lista_contatos_flutter_app/screens/contact_info_screen/contact_info_screen.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key, required this.name, required this.phone})
      : super(key: key);

  final String name;
  final String phone;

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                    height: 30.0,
                    width: 30.0,
                    child: IconButton(
                      padding: const EdgeInsets.all(0.0),
                      color: Colors.red,
                      icon: const Icon(Icons.favorite, size: 24.0),
                      onPressed: () {},
                    ))
              ],
            ),
            const SizedBox(height: 8),
            Container(
              color: Colors.white12,
              width: double.infinity,
              height: 1,
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (builder) => ContactInfoScreen(
              name: widget.name,
              phone: widget.phone,
            ),
          ),
        );
      },
    );
  }
}
