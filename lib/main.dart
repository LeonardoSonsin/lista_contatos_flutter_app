import 'package:flutter/material.dart';
import 'package:lista_contatos_flutter_app/screens/contacts_screen/contacts_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Contacts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const ContactsScreen(),
    );
  }
}
