import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'ColorPalette.dart';
import 'dart:convert';
import 'dart:math';

String baseURL = 'https://anime-facts-rest-api.herokuapp.com/api/v1/';

class factsPage extends StatefulWidget {
  String anime_name = "annonymous";

  factsPage(this.anime_name);

  @override
  State<factsPage> createState() => _factsPageState();
}

class _factsPageState extends State<factsPage> {
  List<String> facts = <String>[];
  bool loaded = false;

  List<Color> colors = <Color>[];

  void getData(anime_name) async {
    Uri uri = Uri.parse(baseURL + anime_name);
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      print(
          '${decodedData['data'][0]['fact_id']}) ${decodedData['data'][0]['fact']}');

      List<String> tempFacts = [];
      List<Color> tempColors = [];

      int index = 0;
      for (var eachItem in decodedData['data']) {
        if (eachItem != null) {
          tempFacts.add('${index + 1}) ${decodedData['data'][index]['fact']}');
          // tempColorCodes.add(
          //     (600 / int.parse(decodedData['data'][index]['fact_id'])).toInt());
          int palette_index = Random().nextInt(palette.length);
          tempColors.add(palette[palette_index]);
          // print(eachItem['anime_name']);
        }
        index++;
      }

      setState(() {
        facts = tempFacts;
        colors = tempColors;
        loaded = true;
      });

      print(decodedData);
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    getData(widget.anime_name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.anime_name),
      ),
      body: !loaded
          ? Center(
              child: SpinKitCubeGrid(
              color: Colors.white,
              size: 100.0,
            ))
          : ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: facts.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 200,
                  color: colors[index],
                  // color: Colors.blueAccent,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      '${facts[index]}',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
    );
  }
}
