
import 'package:bytebank2/components/progress.dart';
import 'package:bytebank2/http/webCliente.dart';
import 'package:bytebank2/models/transaction.dart';
import 'package:flutter/material.dart';
class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions = List();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: FutureBuilder<List<Transaction>>(
          future:findAllTransactions(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              // TODO: Handle this case.
                break;
              case ConnectionState.waiting:
                return Progress(mensagem: 'Carregando transações da API REST',);
                break;
              case ConnectionState.active:
              // TODO: Handle this case.
                break;
              case ConnectionState.done:
                List <Transaction> transactions = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Transaction transaction = transactions[index];
                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.monetization_on),
                        title: Text(
                          transaction.value.toString(),
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          transaction.contact.accountNumber.toString(),
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: transactions.length,
                );
                break;
            }
            return Text('Erro desconhecido');
          }
      ),
    );
  }
}



// import 'package:bytebank2/models/contact.dart';
// import 'package:bytebank2/models/transaction.dart';
// import 'package:flutter/material.dart';
//
// class TransactionsList extends StatelessWidget {
//   final List<Transaction> transactions = List();
//
//   @override
//   Widget build(BuildContext context) {
//     transactions.add(Transaction(100.0, Contact(0, 'Alex', 1000)));
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Transactions'),
//       ),
//       body: ListView.builder(
//         itemBuilder: (context, index) {
//           final Transaction transaction = transactions[index];
//           return Card(
//             child: ListTile(
//               leading: Icon(Icons.monetization_on),
//               title: Text(
//                 transaction.value.toString(),
//                 style: TextStyle(
//                   fontSize: 24.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               subtitle: Text(
//                 transaction.contact.accountNumber.toString(),
//                 style: TextStyle(
//                   fontSize: 16.0,
//                 ),
//               ),
//             ),
//           );
//         },
//         itemCount: transactions.length,
//       ),
//     );
//   }
// }
