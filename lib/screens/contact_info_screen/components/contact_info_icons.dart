import 'package:flutter/material.dart';

import '../widgets/custom_icon.dart';

class ContactInfoIcons extends StatelessWidget {
  const ContactInfoIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          CustomIcon(icon: Icons.message, text: 'mensagem'),
          CustomIcon(icon: Icons.call, text: 'ligar'),
          CustomIcon(icon: Icons.video_call, text: 'vídeo'),
          CustomIcon(icon: Icons.mail, text: 'mail'),
        ],
      ),
    );
  }
}
