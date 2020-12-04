import 'dart:convert';

import 'package:bytebank2/models/contact.dart';
import 'package:bytebank2/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'package:http_interceptor/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';


class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    debugPrint('Requisição: ${data.url}');
    debugPrint('Headers: ${data.headers}');
    debugPrint('Body: ${data.body}');

    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    debugPrint('Resposta: ${data.statusCode}');
    debugPrint('Headers: ${data.headers}');
    debugPrint('Body: ${data.body}');
    return data;
  }
}

Future<List<Transaction>> findAllTransactions() async{
  HttpClientWithInterceptor httpClient = HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);
  Response response = await  httpClient.get('http://192.168.0.104:8080/transactions').timeout(Duration(seconds: 5));
  List<dynamic> decodedJson = jsonDecode(response.body);
  List<Transaction> transactions = List();
  for(Map<String,dynamic>json in decodedJson){
    Map<String, dynamic> jsonContact = json['contact'];
    Contact contact = Contact(0, jsonContact['name'],jsonContact['accountNumber']);
    Transaction transaction = Transaction(json['value'],contact);
    transactions.add(transaction);

  }
  debugPrint('transacoes decodificadas do json: $transactions');
  return transactions;
}

