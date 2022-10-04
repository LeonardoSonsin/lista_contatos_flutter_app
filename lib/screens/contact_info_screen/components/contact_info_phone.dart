import 'package:flutter/material.dart';

class ContactInfoPhone extends StatelessWidget {
  const ContactInfoPhone({Key? key, required this.phone}) : super(key: key);

  final String phone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.grey[900], borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                'Telefone',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                phone,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
