import 'package:flutter/material.dart';

class ContactInfoImage extends StatelessWidget {
  const ContactInfoImage({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(50)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name[0].toUpperCase(),
            style: const TextStyle(fontSize: 54, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
