import 'package:anime_facts/services/apiCalls.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import '../constants/ColorPalette.dart';
import 'dart:math';
part 'factStore.g.dart';

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
    var res = await fetchFacts(animeName);
    if (res != "ERROR") {
      int index = 0;
      for (var eachItem in res['data']) {
        if (eachItem != null) {
          facts.add('${index + 1}) ${res['data'][index]['fact']}');
          int paletteIndex = Random().nextInt(palette.length);
          colors.add(palette[paletteIndex]);
        }
        index++;
      }
      loaded = true;
    }
  } //getFacts
}
