import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key, required this.icon, required this.text, required this.phone})
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

  Future<void> _sendEmail (String phoneNumber) async {
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
        width: MediaQuery.of(context).size.width / 4 - 10,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.grey[900], borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 25,
            ),
            const SizedBox(height: 3),
            Text(
              text,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
      onTap: () {
          text == 'ligar' ? _makePhoneCall(phone) :
          text == 'mensagem' ? _sendMessage(phone) :
          text == 'email' ? _sendEmail(phone) : null;
      },
    );
  }
}
