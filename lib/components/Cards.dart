import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:anime_facts/stores/cardStore.dart';

class Cards extends StatefulWidget {
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  final CardStore _cardStore = CardStore();

  @override
  void initState() {
    // TODO: implement initState

    _cardStore.populateCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return ListView(
          children: _cardStore.itemList,
        );
      },
    );
  }
}
