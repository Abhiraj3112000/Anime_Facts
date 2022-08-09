import 'package:flutter/material.dart';
import 'Cards.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: Cards()));
  }
}
