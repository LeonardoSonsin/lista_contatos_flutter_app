import 'package:flutter/material.dart';
import 'package:lista_contatos_flutter_app/data/contact_dao.dart';
import 'package:lista_contatos_flutter_app/themes/my_colors.dart';

import '../../components/contact/contact.dart';
import '../add_new_contact_screen/new_contact_screen.dart';

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
      body: contactsList(),
      floatingActionButton: addContactButton(context),
    );
  }

  AppBar contactsAppBar() {
    return AppBar(
      toolbarHeight: 120,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Contatos',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.refresh_outlined,
                  color: MyColors().blue,
                ),
                onPressed: () {
                  setState(() {});
                },
              )
            ],
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: MyColors().grey,
              contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color:  MyColors().grey,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: MyColors().grey,
                ),
              ),
              hintText: 'Pesquisar',
              hintStyle: TextStyle(color: MyColors().greyText),
              prefixIcon: Icon(
                Icons.search,
                color: MyColors().greyText,
              ),
              suffixIcon: Icon(
                Icons.keyboard_voice,
                color: MyColors().greyText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding contactsList() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 70),
      child: FutureBuilder<List<Contact>>(
          future: ContactDao().findAll(),
          builder: (context, snapshot) {
            List<Contact>? items = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return loadingState();
              case ConnectionState.waiting:
                return loadingState();
              case ConnectionState.active:
                return loadingState();
              case ConnectionState.done:
                if (snapshot.hasData && items != null) {
                  if (items.isNotEmpty) {
                    return ListView.separated(
                      itemCount: items.length,
                      padding: const EdgeInsets.all(5.0),
                      itemBuilder: (context, index) {
                        Contact contact = items[index];
                        return contact;
                      },
                      separatorBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width,
                            color: MyColors().grey,
                          ),
                        );
                      },
                    );
                  }
                  return emptyContacts();
                }
                return errorLoadContacts();
            }
          }),
    );
  }

  FloatingActionButton addContactButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          context: context,
          builder: (newContext) => const NewContactScreen(),
        ).then((value) => setState(() {}));
      },
      child: const Icon(Icons.add),
    );
  }

  Center loadingState() {
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

  Container emptyContacts() {
    return Container(
      alignment: Alignment.center,
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: Axis.vertical,
        spacing: 20,
        children: [
          const Text(
            'Você ainda não possui \nnenhum contato =/',
            style: TextStyle(fontSize: 24, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  context: context,
                  builder: (newContext) => const NewContactScreen(),
                ).then((value) => setState(() {}));
              },
              child: const Text('Criar novo contato'))
        ],
      ),
    );
  }

  Center errorLoadContacts() {
    return const Center(
      child: Text(
        'Erro ao carregar \nseus contatos X_X',
        style: TextStyle(fontSize: 24, color: Colors.grey),
        textAlign: TextAlign.center,
      ),
    );
  }
}
