import 'package:flutter/material.dart';
import 'package:test1/models/test_api.dart';
import 'package:test1/controllers/number_retriever.dart';

void main() {
  runApp( MyApp());}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FetchData(),
    );
  }
}



