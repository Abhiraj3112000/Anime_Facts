import 'package:anime_facts/pages/FactsPage.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String? image;
  final String name;
  const InfoCard(
      {Key? key, this.image, required this.name, required this.title})
      : super(key: key);

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
              color: Colors.white60,
              image: DecorationImage(
                image: NetworkImage(image as String),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.7), BlendMode.dstATop),
              ),
              borderRadius: BorderRadius.circular(10.0),
              // color: Colors.brown,
              border: Border.all(
                color: Colors.white,
              )),
          child: Center(
            child: Text(
              title,
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
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => factsPage(
                anime_name: name, anime_title: title, anime_image: image),
          ),
        );
      },
    );
  }
}
