import 'package:flutter/material.dart';

class ContactAvatar extends StatelessWidget {
  const ContactAvatar(
      {Key? key,
      required this.name,
      required this.image,
      required this.size,
      required this.fontSize})
      : super(key: key);

  final String name;
  final String image;
  final double size;
  final double fontSize;

  bool isNull(String controller) {
    if (controller.isEmpty) {
      return true;
    }
    return false;
  }

  bool imageExist() {
    if (!isNull(image)) {
      if (image.contains('http')) {
        return true;
      }
      return false;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundColor: Colors.white,
      child: imageExist()
          ? ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/images/error_loading.png');
                }
              ))
          : Text(
              name[0].toUpperCase(),
              style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
    );
  }
}
