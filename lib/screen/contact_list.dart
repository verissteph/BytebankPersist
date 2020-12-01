import 'package:bytebank2/database/app_database.dart';
import 'package:bytebank2/models/contact.dart';
import 'package:bytebank2/screen/formulario_de_contato.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => NewContact()))
              .then((newContact) => debugPrint(newContact.toString()));
        },
        child: Icon(Icons.add),
      ),
      body:FutureBuilder(
        future:findAll(),
          builder: (context, snapshot){
          List<Contact> contacts = snapshot.data;
          return ListView.builder(
            itemCount: contacts.length,
              itemBuilder:  (context, index){
              Contact contact = contacts[index];
              return ContactItem(contact);
              },
          );
          },
    ));
  }
}

class ContactItem extends StatelessWidget {
  final Contact contact;
  ContactItem(this.contact);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(contact.name, style: TextStyle(fontSize: 16.0)),
        subtitle: Text(contact.accountNumber.toString(), style: TextStyle(fontSize: 16.0)),
      ),
    );
  }
}
