import 'package:flutter/material.dart';
import 'pages/HomePage.dart';

void main() => runApp(const AnimeFacts());

class AnimeFacts extends StatelessWidget {
  const AnimeFacts({Key? key}) : super(key: key);

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
