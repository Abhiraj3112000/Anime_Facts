import 'package:flutter/material.dart';

class Fact extends StatelessWidget {
  const Fact(
      {Key? key,
      required this.colors,
      required this.facts,
      required this.index})
      : super(key: key);

  final List<Color> colors;
  final List<String> facts;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colors[index].withOpacity(0.9),
          border: Border.all(
            color: Colors.white,
          )),
      height: 200,

      // color: Colors.blueAccent,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Text(
              facts[index],
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
