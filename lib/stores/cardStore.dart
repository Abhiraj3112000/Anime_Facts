import 'package:mobx/mobx.dart';
import '../InfoCard.dart';
import 'package:anime_facts/animeNames.dart';

part 'cardStore.g.dart';

String? errorImage =
    'https://rockcontent.com/wp-content/uploads/2021/02/stage-en-error-1020.png';

class CardStore = Cards with _$CardStore;

abstract class Cards with Store {
  @observable
  List<InfoCard> itemList = [
    InfoCard(name: '', image: errorImage),
  ];

  @action
  void populateCards() {
    itemList = [];
    if (myData != null) {
      for (var eachItem in myData) {
        if (eachItem != null) {
          itemList.add(
            InfoCard(
                name: eachItem['anime_name'] as String,
                image: eachItem['anime_img'] as String?),
          );
        }
      }
    }
  } //populateCards

}
