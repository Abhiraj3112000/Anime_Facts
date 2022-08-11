import 'package:mobx/mobx.dart';
import '../components/Card.dart';
import 'package:anime_facts/constants/AnimeNames.dart';

part 'titleStore.g.dart';

class TitleStore = Title with _$TitleStore;

abstract class Title with Store {
  @observable
  String title = "Annonymous";

  @action
  void changeTitle() {
    title = "ANIMES";
  }
}
