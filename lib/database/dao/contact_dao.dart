
import 'package:bytebank2/models/contact.dart';
import 'package:sqflite/sqflite.dart';

import '../app_database.dart';

class ContactDao{
  static const String _tableName = 'contacts_bank';
  static const String _name = 'name';
  static const String _id = 'id';
  static const String _account_number= 'account_number';


  static const String TABLE_SQL = 'CREATE TABLE $_tableName('
    '$_id INTEGER PRIMARY KEY, '
    '$_name  TEXT, '
    '$_account_number INTEGER)';

  Future<int> save(Contact contact) async{
    Map<String, dynamic> contactMap =toMap(contact);

    Database db = await getDatabase();
    return db.insert(_tableName, contactMap);
  }
  Map <String,dynamic> toMap(Contact contact) {
    Map<String,dynamic> contactMap = Map();
    contactMap[_name] = contact.name;
    contactMap[_account_number] = contact.accountNumber;
    return contactMap;

  }

  Future<List<Contact>> findAll() async {
    Database db = await getDatabase();
    List <Map<String, dynamic>> maps = await db.query(_tableName);
    return toList(maps);
  }
  List <Contact> toList(List<Map<String,dynamic>>maps){
    List<Contact> contacts = List();
    for (Map<String, dynamic> map in maps) {
      final Contact contact = Contact(
        map[ _id],
        map[_name],
        map[_account_number],
      );
      contacts.add(contact);
    }
    return contacts;

  }

}