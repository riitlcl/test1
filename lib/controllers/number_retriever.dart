import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import "package:test1/models/test_api.dart";

class RandomNumberFetch extends StatefulWidget {
  const RandomNumberFetch({Key? key}) : super(key: key);

  @override
  _RandomNumberFetchState createState() => _RandomNumberFetchState();
}

class _RandomNumberFetchState extends State<RandomNumberFetch> {

  Future<int> randomNumber = TestApi.getRandomNumber();
  List<int> previousNumbres=[];

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 32),
    child: FutureBuilder(
      future: randomNumber,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot){
    String result ="Loading";
      if(snapshot.connectionState != ConnectionState.waiting && snapshot.hasData){
      result=snapshot.data.toString();
      }
      return Column(
      children: [
        ElevatedButton(onPressed: snapshot.connectionState == ConnectionState.waiting
     ? null
    : () {
          setState(() {
            previousNumbres.add(snapshot.data!);
            randomNumber=TestApi.getRandomNumber();
          });

    },
    child: Text("Get random number")),
    Text(result, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),)
    ,
    Text(previousNumbres.isNotEmpty ? "Previous numbers" : "", style: TextStyle(fontSize: 24),),
    Column(children: previousNumbres.map<Widget>((int element)=>Text(element.toString())).toList(),)
      ],


      );
      }));
  }
}
