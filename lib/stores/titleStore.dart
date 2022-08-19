import 'package:mobx/mobx.dart';
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
