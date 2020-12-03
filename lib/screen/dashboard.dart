import 'package:bytebank2/screen/contact_list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  void showContactList(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ContactList()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('images/bytebank_logo.png'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FeatureItem(
                      'Transfer',
                      Icons.monetization_on,
                      onClick: () {
                        showContactList(context);
                      },
                    ),
                    FeatureItem(
                      'Transaction feed',
                      Icons.description,
                      onClick: () {
                        print("transaction feed was clicked!");
                      },
                    ),

                  ],
                ),
              ),
            ]),
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function onClick;

  FeatureItem(this.label, this.icon, {@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () => onClick(),
          child: Container(
            padding: EdgeInsets.all(8.0),
            color: Theme.of(context).primaryColor,
            height: 100,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, color: Colors.white, size: 32),
                Text(
                  label,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
