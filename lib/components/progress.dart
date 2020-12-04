import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Progress extends StatelessWidget {

  String mensagem;

  Progress({ this.mensagem = 'Carregando...' });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Text(mensagem),
        ],
      ),
    );
    ;
  }
}
