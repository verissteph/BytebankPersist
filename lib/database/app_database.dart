import 'package:bytebank2/database/dao/contact_dao.dart';
import 'package:bytebank2/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'bytebank.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute(ContactDao.TABLE_SQL);
    }, version: 1,
    onDowngrade: onDatabaseDowngradeDelete);

}