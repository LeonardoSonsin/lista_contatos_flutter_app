import 'package:flutter/material.dart';
import 'package:lista_contatos_flutter_app/themes/my_colors.dart';

class ContactInfoEmail extends StatelessWidget {
  const ContactInfoEmail(
      {Key? key, required this.info, required this.text})
      : super(key: key);

  final String info;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
            color: MyColors().grey, borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                text,
                style: TextStyle(fontSize: 16, color: MyColors().white),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                info,
                style: TextStyle(fontSize: 18, color: MyColors().blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
