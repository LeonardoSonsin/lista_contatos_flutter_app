import 'package:flutter/material.dart';
import 'package:lista_contatos_flutter_app/themes/my_colors.dart';

class ContactInfoNamePhone extends StatelessWidget {
  const ContactInfoNamePhone({Key? key, required this.name, required this.phone}) : super(key: key);

  final String name;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            name,
            style: TextStyle(fontSize: 40, color: MyColors().white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 20),
          child: Text(
            phone,
            style: TextStyle(fontSize: 18, color: MyColors().greyText),
          ),
        ),
      ],
    );
  }
}
