import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:anime_facts/stores/cardStore.dart';
import 'package:anime_facts/stores/titleStore.dart';

class Cards extends StatefulWidget {
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  final CardStore _cardStore = CardStore();
  final TitleStore _titleStore = TitleStore();

  @override
  void initState() {
    // TODO: implement initState

    _cardStore.populateCards();
    _titleStore.changeTitle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return SafeArea(
          child: Column(
            children: [
              Text(
                _titleStore.title,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white54,
                ),
              ),
              Expanded(
                child: ListView(
                  children: _cardStore.itemList,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
