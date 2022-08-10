import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';
import 'package:anime_facts/animeNames.dart';
import 'InfoCard.dart';
import 'package:http/http.dart' as http;

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
    int index = 0;
    List<InfoCard> tempList = [];

    if (myData != null) {
      for (var eachItem in myData) {
        if (eachItem != null) {
          tempList.add(
            InfoCard(
                name: eachItem['anime_name'] as String,
                image: eachItem['anime_img'] as String?),
          );
        }
      }
    }

    setState(() {
      _itemList = tempList;
      loaded = true;
    });
    index++;
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
