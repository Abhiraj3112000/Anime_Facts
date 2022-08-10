import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:anime_facts/stores/cardStore.dart';

class Cards extends StatefulWidget {
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  CardStore _cards = CardStore();

  @override
  void initState() {
    // TODO: implement initState

    _cards.populateCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Observer(
        builder: (context) {
          return ListView(
            children: _cards.itemList,
          );
        },
      ),
    );
  }
}
