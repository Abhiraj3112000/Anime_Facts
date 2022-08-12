import 'package:flutter/material.dart';
import 'Fact.dart';

class FactList extends StatelessWidget {
  const FactList({
    Key? key,
    required this.facts,
    required this.colors,
  }) : super(key: key);

  final List<String> facts;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: facts.length,
      itemBuilder: (BuildContext context, int index) {
        return Fact(colors: colors, facts: facts, index: index);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
