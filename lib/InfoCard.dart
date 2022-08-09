import 'package:anime_facts/factsPage.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class InfoCard extends StatelessWidget {
  final String? image;
  final String name;
  const InfoCard({Key? key, this.image, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 20,
        margin: const EdgeInsets.all(20.0),
        child: Container(
          width: double.infinity,
          height: 250.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image as String),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.blueAccent,
              border: Border.all(
                color: Colors.white,
              )),
          child: Center(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(5.0, 5.0),
                  ),
                  // Shadow(
                  //   color: Colors.black,
                  //   blurRadius: 10.0,
                  //   offset: Offset(-10.0, 5.0),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => factsPage(name)));
      },
    );
  }
}
