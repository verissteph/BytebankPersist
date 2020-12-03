import 'package:bytebank2/database/dao/contact_dao.dart';
import 'package:bytebank2/models/contact.dart';
import 'package:bytebank2/screen/formulario_de_contato.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final ContactDao dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contacts'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator
                .of(context)
                .push(MaterialPageRoute(builder: (context) => NewContact()
            ))
                .then((newContact) =>
                setState(() => debugPrint('Recarregando a lista..')));
            },
          child: Icon(Icons.add),
        ),
        body: FutureBuilder<List<Contact>>(
          initialData: List(),
          future:
          Future.delayed(Duration(seconds: 2)).then((value) => dao.findAll()),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Text('Loading'),
                    ],
                  ),
                );
                break;
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                List<Contact> contacts = snapshot.data;

                return ListView.builder(
                  itemBuilder: (context, index) {
                    Contact contact = contacts[index];
                    return ContactItem(contact);
                  },
                  itemCount: contacts.length,
                );
                break;
            }

            return Text(
                'Erro desconhecido! Entre em contato com o nosso suporte');
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
        subtitle: Text(contact.accountNumber.toString(),
            style: TextStyle(fontSize: 16.0)),
      ),
    );
  }
}
