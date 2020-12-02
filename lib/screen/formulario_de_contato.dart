import 'package:bytebank2/database/app_database.dart';
import 'package:bytebank2/models/contact.dart';
import 'package:flutter/material.dart';

class NewContact extends StatefulWidget {
  @override
  _NewContactState createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController accountNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Full Name",
              ),
              style: TextStyle(fontSize: 24.0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: accountNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Account number ", hintText: "0000"),
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  child: Text("Create"),
                  onPressed: () {
                    final String name = nameController.text;
                    final int accountNumber =
                        int.tryParse(accountNumberController.text);
                    final Contact newContact = Contact(0, name, accountNumber);
                    save(newContact).then((value) => Navigator.pop(context));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
