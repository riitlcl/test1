import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class TestApi {
  final String apiUrl = "https://csrng.net/csrng/csrng.php?min=1&max=1000";
  late final String parameter;
  Future<List<dynamic>> fetchnumber() async {
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body)['results'];
  }
}