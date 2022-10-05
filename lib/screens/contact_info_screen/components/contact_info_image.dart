import 'package:flutter/material.dart';

class ContactInfoImage extends StatelessWidget {
  const ContactInfoImage({Key? key, required this.name, required this.image})
      : super(key: key);

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: CircleAvatar(
        radius: 80.0,
        backgroundImage: image.isNotEmpty ? NetworkImage(image) : null,
        backgroundColor: Colors.white,
        child: image.isEmpty
            ? Text(
                name[0].toUpperCase(),
                style: const TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
              )
            : null,
      ),
    );
  }
}
