import 'package:bytebank2/screen/formulario_de_contato.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: ListView(children: <Widget>[
        Card(
          child: ListTile(
            title: Text('Stephanie', style: TextStyle(fontSize: 24.0)),
            subtitle: Text('1000', style: TextStyle(fontSize: 16.0)),
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => NewContact()))
              .then((newContact) => debugPrint(newContact.toString()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
