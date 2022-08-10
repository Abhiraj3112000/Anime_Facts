import 'package:flutter/material.dart';
import 'pages/HomePage.dart';

void main() => runApp(const AnimeFacts());

class AnimeFacts extends StatefulWidget {
  const AnimeFacts({Key? key}) : super(key: key);

  @override
  State<AnimeFacts> createState() => _AnimeFactsState();
}

class _AnimeFactsState extends State<AnimeFacts> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        // home: homePage(),
        initialRoute: '/',
        routes: {
          '/': (context) => const homePage(),
          // '/facts': (context) => const factsPage(),
        });
  }
}
