import 'package:flutter/material.dart';

import '../widgets/custom_icon.dart';

class ContactInfoIcons extends StatelessWidget {
  const ContactInfoIcons({Key? key, required this.phone}) : super(key: key);

  final String phone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIcon(icon: Icons.message, text: 'mensagem', phone: phone,),
          CustomIcon(icon: Icons.call, text: 'ligar',  phone: phone,),
          CustomIcon(icon: Icons.video_call, text: 'vídeo',  phone: phone,),
          CustomIcon(icon: Icons.mail, text: 'email',  phone: phone,),
        ],
      ),
    );
  }
}
