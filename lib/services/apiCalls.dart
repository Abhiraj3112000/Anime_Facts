import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constants/Globals.dart';

Future<dynamic> fetchFacts(animeName) async {
  Uri uri = Uri.parse("$FACTS_BASE_URL$animeName");
  http.Response response = await http.get(uri);
  if (response.statusCode == 200) {
    String data = response.body;
    var decodedData = jsonDecode(data);
    return decodedData;
  } else {
    if (kDebugMode) {
      print("ERROR -> ${response.statusCode}");
    }
    return "ERROR";
  }
}
