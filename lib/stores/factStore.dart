import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../constants/ColorPalette.dart';
import 'dart:convert';
import 'dart:math';

part 'factStore.g.dart';

const String baseURL = 'https://anime-facts-rest-api.herokuapp.com/api/v1/';

class FactStore = Facts with _$FactStore;

abstract class Facts with Store {
  @observable
  List<String> facts = <String>[];

  @observable
  bool loaded = false;

  @observable
  List<Color> colors = <Color>[];

  @action
  Future<void> getFacts(animeName) async {
    Uri uri = Uri.parse(baseURL + animeName);
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      // print(
      //     '${decodedData['data'][0]['fact_id']}) ${decodedData['data'][0]['fact']}');

      int index = 0;
      for (var eachItem in decodedData['data']) {
        if (eachItem != null) {
          facts.add('${index + 1}) ${decodedData['data'][index]['fact']}');
          // tempColorCodes.add(
          //     (600 / int.parse(decodedData['data'][index]['fact_id'])).toInt());
          int paletteIndex = Random().nextInt(palette.length);
          colors.add(palette[paletteIndex]);
          // print(eachItem['anime_name']);
        }
        index++;
      }

      loaded = true;
      // print(decodedData);
    } else {
      if (kDebugMode) {
        print(response.statusCode);
      }
    }
  } //getFacts

}
