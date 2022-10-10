import 'package:flutter/material.dart';
import 'package:lista_contatos_flutter_app/themes/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon(
      {Key? key, required this.icon, required this.text, required this.phone})
      : super(key: key);

  final String text;
  final IconData icon;
  final String phone;

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: "tel",
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _sendMessage(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: "sms",
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _sendEmail(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: "mailto",
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width / 4 - 20,
        height: 60,
        decoration: BoxDecoration(
          color: MyColors().grey,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 25,
              color: MyColors().blue,
            ),
            const SizedBox(height: 3),
            Text(
              text,
              style: TextStyle(
                fontSize: 12,
                color: MyColors().blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        text == 'ligar'
            ? _makePhoneCall(phone)
            : text == 'mensagem'
                ? _sendMessage(phone)
                : text == 'email'
                    ? _sendEmail(phone)
                    : null;
      },
    );
  }
}
