import 'package:mobx/mobx.dart';
import '../components/Card.dart';
import 'package:anime_facts/constants/AnimeNames.dart';

part 'cardStore.g.dart';

String? errorImage =
    'https://rockcontent.com/wp-content/uploads/2021/02/stage-en-error-1020.png';

class CardStore = Cards with _$CardStore;

abstract class Cards with Store {
  @observable
  List<InfoCard> itemList = [
    InfoCard(title: '', name: '', image: errorImage),
  ];

  @action
  void populateCards() {
    itemList = [];
    for (var eachItem in myData) {
      itemList.add(
        InfoCard(
            title: eachItem['anime_title'] as String,
            name: eachItem['anime_name'] as String,
            image: eachItem['anime_img'] as String?),
      );
    }
  } //populateCards

}
