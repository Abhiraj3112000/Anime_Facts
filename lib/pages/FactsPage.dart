import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:anime_facts/stores/factStore.dart';

String baseURL = 'https://anime-facts-rest-api.herokuapp.com/api/v1/';

class factsPage extends StatefulWidget {
  String anime_name = "anonymous";
  String anime_title = "ANONYMOUS";
  String? anime_image = "";

  factsPage(this.anime_name, this.anime_title, this.anime_image, {Key? key})
      : super(key: key);

  @override
  State<factsPage> createState() => _factsPageState();
}

class _factsPageState extends State<factsPage> {
  FactStore factStore = FactStore();

  @override
  void initState() {
    // TODO: implement initState

    factStore.getFacts(widget.anime_name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.network(
        widget.anime_image as String,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(widget.anime_title),
        ),
        body: Observer(
          builder: (context) {
            return !factStore.loaded
                ? const Center(
                    child: SpinKitCubeGrid(
                    color: Colors.white,
                    size: 100.0,
                  ))
                : FactList(facts: factStore.facts, colors: factStore.colors);
          },
        ),
      ),
    ]);
  }
}

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
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
