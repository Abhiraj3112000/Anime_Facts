import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:anime_facts/stores/factStore.dart';
import '../components/FactList.dart';

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
