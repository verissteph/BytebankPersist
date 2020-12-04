import 'package:flutter/material.dart';
import 'package:http/http.dart';

void findAllTransactions() async{
  Response response = await get('http://192.168.0.01:8080/transactions');
  debugPrint(response.body);
}