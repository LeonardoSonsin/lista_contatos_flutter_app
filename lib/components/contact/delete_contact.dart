import 'package:flutter/material.dart';

import '../../data/contact_dao.dart';

void deleteContact(BuildContext context, String contactName) {
  Widget cancelButton = TextButton(
    child: const Text("Não"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Sim"),
    onPressed: () {
      ContactDao().delete(contactName);
      Navigator.pop(context);
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("Excluindo o contato '$contactName'"),
    content: const Text("Deseja realmente excluir esse contato?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
