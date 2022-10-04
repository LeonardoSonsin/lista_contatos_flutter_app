import 'package:flutter/material.dart';
import 'package:lista_contatos_flutter_app/data/contact_dao.dart';
import 'package:lista_contatos_flutter_app/screens/contacts_screen/components/new_contact_button.dart';

import '../../components/contact/contact.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: contactsAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<Contact>>(
            future: ContactDao().findAll(),
            builder: (context, snapshot) {
              List<Contact>? items = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return buildLoadingState();
                case ConnectionState.waiting:
                  return buildLoadingState();
                case ConnectionState.active:
                  return buildLoadingState();
                case ConnectionState.done:
                  if (snapshot.hasData && items != null) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                          itemCount: items.length,
                          padding: const EdgeInsets.all(5.0),
                          itemBuilder: (context, index) {
                            Contact contact = items[index];
                            return contact;
                          });
                    }
                    return buildEmptyContacts();
                  }
                  return const Text('Erro ao carregar lista de contatos X_X');
              }
            }),
      ),
      floatingActionButton: const AddNewContactButton(),
    );
  }

  Center buildEmptyContacts() {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: Axis.vertical,
        spacing: 10,
        children: const [
          Icon(
            Icons.error_outline,
            size: 50,
            color: Colors.grey,
          ),
          Text(
            'Você ainda não tem nenhum \ncontato cadastrado =/',
            style: TextStyle(fontSize: 24, color: Colors.grey),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Center buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          CircularProgressIndicator(),
          Text('Carregando...'),
        ],
      ),
    );
  }

  AppBar contactsAppBar() {
    return AppBar(
      toolbarHeight: 80,
      title: const Text(
        'Contatos',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
      elevation: 0,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.refresh_outlined,
          ),
          onPressed: () {
            setState(() {});
          },
        )
      ],
    );
  }
}
