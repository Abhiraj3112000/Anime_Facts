import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';
import 'InfoCard.dart';
import 'package:http/http.dart' as http;

Uri uri = Uri.parse('https://anime-facts-rest-api.herokuapp.com/api/v1');
String? errorImage =
    'https://rockcontent.com/wp-content/uploads/2021/02/stage-en-error-1020.png';

class Cards extends StatefulWidget {
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  bool loaded = false;
  List<InfoCard> _itemList = [
    InfoCard(name: '', image: errorImage),
  ];

  void getData() async {
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      // print(decodedData['data'][0]['anime_name']);

      int index = 0;
      List<InfoCard> tempList = [];

      for (var eachItem in decodedData['data']) {
        if (eachItem != null && eachItem['anime_name'] != 'itachi_uchiha') {
          tempList.add(
            InfoCard(
                name: eachItem['anime_name'],
                image: eachItem['anime_img'] as String?),
          );
          // print(eachItem['anime_name']);
        }
      }

      setState(() {
        _itemList = tempList;
        loaded = true;
      });
      index++;
      // print(_itemList);
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: !loaded
            ? Center(
                child: SpinKitCubeGrid(
                color: Colors.white,
                size: 100.0,
              ))
            : ListView(
                children: _itemList,
              ));
  }
}
