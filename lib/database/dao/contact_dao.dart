
import 'package:bytebank2/models/contact.dart';
import 'package:sqflite/sqflite.dart';

import '../app_database.dart';

class ContactDao{
static const String TABLE_SQL = 'CREATE TABLE contacts_bank('
    'id INTEGER PRIMARY KEY, '
    'name  TEXT, '
    'account_number INTEGER)';

  Future<int> save(Contact contact) async{
    Map<String, dynamic> contactMap = Map();
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;
    Database db = await getDatabase();
    return db.insert('contacts_bank', contactMap);
  }

  Future<List<Contact>> findAll() async {
    Database db = await getDatabase();
    List <Map<String, dynamic>> maps = await db.query('contacts_bank');

    List<Contact> contacts = List();
    for (Map<String, dynamic> map in maps) {
      final Contact contact = Contact(
        map['id'],
        map['name'],
        map['account_number'],
      );
      contacts.add(contact);
    }
    return contacts;

  }

}