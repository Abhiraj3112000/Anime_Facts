// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'factStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FactStore on Facts, Store {
  late final _$factsAtom = Atom(name: 'Facts.facts', context: context);

  @override
  List<String> get facts {
    _$factsAtom.reportRead();
    return super.facts;
  }

  @override
  set facts(List<String> value) {
    _$factsAtom.reportWrite(value, super.facts, () {
      super.facts = value;
    });
  }

  late final _$loadedAtom = Atom(name: 'Facts.loaded', context: context);

  @override
  bool get loaded {
    _$loadedAtom.reportRead();
    return super.loaded;
  }

  @override
  set loaded(bool value) {
    _$loadedAtom.reportWrite(value, super.loaded, () {
      super.loaded = value;
    });
  }

  late final _$colorsAtom = Atom(name: 'Facts.colors', context: context);

  @override
  List<Color> get colors {
    _$colorsAtom.reportRead();
    return super.colors;
  }

  @override
  set colors(List<Color> value) {
    _$colorsAtom.reportWrite(value, super.colors, () {
      super.colors = value;
    });
  }

  late final _$getFactsAsyncAction =
      AsyncAction('Facts.getFacts', context: context);

  @override
  Future<void> getFacts(dynamic anime_name) {
    return _$getFactsAsyncAction.run(() => super.getFacts(anime_name));
  }

  @override
  String toString() {
    return '''
facts: ${facts},
loaded: ${loaded},
colors: ${colors}
    ''';
  }
}
