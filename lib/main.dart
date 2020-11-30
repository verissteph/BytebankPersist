import 'file:///C:/Users/stephanie.v.pinheiro/Desktop/Flutter/bytebank2/lib/screen/formulario_de_contato.dart';
import 'package:flutter/material.dart';

import 'screen/dashboard.dart';

void main() => runApp(Bytebank2());

class Bytebank2 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home:Dashboard(),
    );
  }
}


