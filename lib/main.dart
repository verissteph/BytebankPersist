
import 'package:bytebank2/database/app_database.dart';
import 'package:bytebank2/models/contact.dart';
import 'package:flutter/material.dart';

import 'screen/dashboard.dart';

void main() {
  runApp(Bytebank2());
  save(Contact(1, 'Pedro', 20560)).then((id) {
    findAll().then((contacts) => debugPrint(contacts.toString()));
  });
}

class Bytebank2 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
        accentColor: Colors.blueAccent[700],
      ),
      home: Dashboard(),
    );
  }

}