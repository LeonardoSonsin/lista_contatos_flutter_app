import 'package:sqflite/sqflite.dart';

import '../components/contact/contact.dart';
import 'database.dart';

class ContactDao {
  static const String _tablename = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _phone = 'phone';
  static const String _email = 'email';
  static const String _image = 'image';

  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_id TEXT, '
      '$_name TEXT, '
      '$_phone INTEGER, '
      '$_email TEXT, '
      '$_image TEXT) ';

  create(Contact contact) async {
    final Database database = await getDatabase();
    var contactExist = await find(contact.id);
    Map<String, dynamic> contactMap = toMap(contact);
    if (contactExist.isEmpty) {
      return await database.insert(_tablename, contactMap);
    }
  }

  update(Contact contact) async {
    final Database database = await getDatabase();
    var contactExist = await find(contact.id);
    Map<String, dynamic> contactMap = toMap(contact);
    if (contactExist.isNotEmpty) {
      return await database.update(_tablename, contactMap,
          where: '$_id = ?', whereArgs: [contact.id]);
    }
  }

  delete(String contactId) async {
    final Database database = await getDatabase();
    return await database
        .delete(_tablename, where: '$_id = ?', whereArgs: [contactId]);
  }

  Map<String, dynamic> toMap(Contact contact) {
    final Map<String, dynamic> contactsMap = {};
    contactsMap[_id] = contact.id;
    contactsMap[_name] = contact.name;
    contactsMap[_phone] = contact.phone;
    contactsMap[_email] = contact.email;
    contactsMap[_image] = contact.image;
    return contactsMap;
  }

  Future<List<Contact>> findAll() async {
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(_tablename);
    return toContactList(result);
  }

  Future<List<Contact>> find(String contactId) async {
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database
        .query(_tablename, where: '$_id = ?', whereArgs: [contactId]);
    return toContactList(result);
  }

  List<Contact> toContactList(List<Map<String, dynamic>> mapsList) {
    final List<Contact> contactsList = [];
    for (Map<String, dynamic> line in mapsList) {
      final Contact contact = Contact(
        id: line[_id],
        name: line[_name],
        phone: line[_phone],
        email: line[_email],
        image: line[_image],
      );
      contactsList.add(contact);
    }
    return contactsList;
  }
}
