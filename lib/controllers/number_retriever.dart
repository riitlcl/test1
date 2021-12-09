import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

late final String parameter;
class FetchData extends StatelessWidget{

  final String apiUrl = "https://csrng.net/csrng/csrng.php?parameter1=1¶meter2=1000";

  Future<List<dynamic>> fetchnumber() async {

    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body)['results'];

  }

  Map<String,dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["param"] = parameter;
    return map;


  }
 // Map<String,dynamic> numbersMap = parameter.toMap();

  storedCart(numbersMap) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('cart', json.encode(numbersMap));
  }
late int random=random;
late String status;
late int min;
late int max;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Fetched Number'),
      ),
      body: Container(

        child: FutureBuilder<List<dynamic>>(
          future: fetchnumber(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
             // print(snapshot.data[0]);
        return Container(
          child:Center(
            child:CircularProgressIndicator()
          )
        );
            }else {
              print('Random number: ${snapshot.data[3]}');
            }
          },
             ),

      ),
      body:Center(
      child: ElevatedButton(
        onPressed: (){FetchData();},
    child:Text("GET DATA"),
    ),)
    );
  }

}