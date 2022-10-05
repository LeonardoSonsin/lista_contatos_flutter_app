import 'package:sqflite/sqflite.dart';

import '../components/contact/contact.dart';
import 'database.dart';

class ContactDao {
  static const String _tablename = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _phone = 'phone';

  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_id TEXT, '
      '$_name TEXT, '
      '$_phone INTEGER) ';

  save(Contact contact) async {
    print('Save: ');
    final Database database = await getDatabase();
    var contactExist = await find(contact.id);
    Map<String, dynamic> contactMap = toMap(contact);
    if (contactExist.isEmpty) {
      print('A tarefa foi criada');
      return await database.insert(_tablename, contactMap);
    } else {
      print('A tarefa foi atualizada');
      return await database.update(_tablename, contactMap,
          where: '$_id = ?', whereArgs: [contact.id]);
    }
  }

  update(Contact contact) async {
    print('Update: ');
    final Database database = await getDatabase();
    var contactExist = await find(contact.id);
    Map<String, dynamic> contactMap = toMap(contact);
    if (contactExist.isNotEmpty) {
      print('A tarefa foi criada');
      return await database.update(_tablename, contactMap,
          where: '$_id = ?', whereArgs: [contact.id]);
    }
  }

  delete(String contactId) async {
    print('Delete: ');
    final Database database = await getDatabase();
    print('A tarefa foi deletada');
    return await database
        .delete(_tablename, where: '$_id = ?', whereArgs: [contactId]);
  }

  Map<String, dynamic> toMap(Contact contact) {
    print('Convertendo Tarefa em Map...');
    final Map<String, dynamic> contactsMap = {};
    contactsMap[_id] = contact.id;
    contactsMap[_name] = contact.name;
    contactsMap[_phone] = contact.phone;
    print('Mapa de tarefas: $contactsMap');
    return contactsMap;
  }

  Future<List<Contact>> findAll() async {
    print('FindAll: ');
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(_tablename);
    print('Procurando dados no banco...');
    print('Encontrado: ${toContactList(result)}');
    return toContactList(result);
  }

  Future<List<Contact>> find(String contactId) async {
    print('Find: ');
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database
        .query(_tablename, where: '$_id = ?', whereArgs: [contactId]);
    print('Procurando dados no banco...');
    print('Encontrado: ${toContactList(result)}');
    return toContactList(result);
  }

  List<Contact> toContactList(List<Map<String, dynamic>> mapsList) {
    print('Convertendo Map para Lista de Contatos...');
    final List<Contact> contactsList = [];
    for (Map<String, dynamic> line in mapsList) {
      final Contact contact = Contact(id: line[_id], name: line[_name], phone: line[_phone]);
      contactsList.add(contact);
    }
    print('Lista de Contatos');
    print('$contactsList');
    return contactsList;
  }
}
