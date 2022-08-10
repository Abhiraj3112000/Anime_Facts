// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cardStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CardStore on Cards, Store {
  late final _$itemListAtom = Atom(name: 'Cards.itemList', context: context);

  @override
  List<InfoCard> get itemList {
    _$itemListAtom.reportRead();
    return super.itemList;
  }

  @override
  set itemList(List<InfoCard> value) {
    _$itemListAtom.reportWrite(value, super.itemList, () {
      super.itemList = value;
    });
  }

  late final _$CardsActionController =
      ActionController(name: 'Cards', context: context);

  @override
  void populateCards() {
    final _$actionInfo =
        _$CardsActionController.startAction(name: 'Cards.populateCards');
    try {
      return super.populateCards();
    } finally {
      _$CardsActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itemList: ${itemList}
    ''';
  }
}
