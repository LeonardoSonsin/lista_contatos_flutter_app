import 'package:flutter/material.dart';
import 'package:lista_contatos_flutter_app/components/contact/contact_avatar.dart';
import 'package:lista_contatos_flutter_app/screens/contact_info_screen/contact_info_screen.dart';
import 'package:lista_contatos_flutter_app/themes/my_colors.dart';

import '../../data/contact_dao.dart';

class Contact extends StatefulWidget {
  const Contact(
      {Key? key,
      required this.id,
      required this.name,
      required this.phone,
      required this.email,
      required this.image,
      required this.favorite})
      : super(key: key);

  final String id;
  final String name;
  final String phone;
  final String email;
  final String image;
  final String favorite;

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ContactAvatar(name: widget.name, image: widget.image, size: 20, fontSize: 24),
      title: Text(widget.name, style: TextStyle(color: MyColors().white,),),
      subtitle: Text(widget.phone, style: TextStyle(color: MyColors().white,),),
      trailing: IconButton(
        color: MyColors().red,
        icon: Icon(widget.favorite == 'true' ? Icons.favorite : null),
        onPressed: () {},
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (newContext) => ContactInfoScreen(
              id: widget.id,
              name: widget.name,
              phone: widget.phone,
              email: widget.email,
              image: widget.image,
              favorite: widget.favorite,
            ),
          ),
        ).then((value) => setState((){}));
      },
      onLongPress: () {
        deleteContactDialog();
      },
    );
  }

  deleteContactDialog() => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Excluindo o contato '${widget.name}'"),
            content: const Text("Deseja realmente excluir esse contato?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancelar"),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    ContactDao().delete(widget.id);
                    Navigator.pop(context);
                  });
                },
                child: const Text("Sim"),
              ),
            ],
          );
        },
      );
}
