// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$listCharacterModelAtom =
      Atom(name: 'HomeControllerBase.listCharacterModel', context: context);

  @override
  List<CharacterModel> get listCharacterModel {
    _$listCharacterModelAtom.reportRead();
    return super.listCharacterModel;
  }

  @override
  set listCharacterModel(List<CharacterModel> value) {
    _$listCharacterModelAtom.reportWrite(value, super.listCharacterModel, () {
      super.listCharacterModel = value;
    });
  }

  late final _$searchBarAtom =
      Atom(name: 'HomeControllerBase.searchBar', context: context);

  @override
  bool get searchBar {
    _$searchBarAtom.reportRead();
    return super.searchBar;
  }

  @override
  set searchBar(bool value) {
    _$searchBarAtom.reportWrite(value, super.searchBar, () {
      super.searchBar = value;
    });
  }

  late final _$nextPageUrlAtom =
      Atom(name: 'HomeControllerBase.nextPageUrl', context: context);

  @override
  String get nextPageUrl {
    _$nextPageUrlAtom.reportRead();
    return super.nextPageUrl;
  }

  @override
  set nextPageUrl(String value) {
    _$nextPageUrlAtom.reportWrite(value, super.nextPageUrl, () {
      super.nextPageUrl = value;
    });
  }

  late final _$getCharactersAsyncAction =
      AsyncAction('HomeControllerBase.getCharacters', context: context);

  @override
  Future<List<CharacterModel>> getCharacters() {
    return _$getCharactersAsyncAction.run(() => super.getCharacters());
  }

  late final _$getCharactersByUrlAsyncAction =
      AsyncAction('HomeControllerBase.getCharactersByUrl', context: context);

  @override
  Future<List<CharacterModel>> getCharactersByUrl() {
    return _$getCharactersByUrlAsyncAction
        .run(() => super.getCharactersByUrl());
  }

  late final _$filterCharacterAsyncAction =
      AsyncAction('HomeControllerBase.filterCharacter', context: context);

  @override
  Future<List<CharacterModel>> filterCharacter(
      {String? name, required String status, required String gender}) {
    return _$filterCharacterAsyncAction.run(() =>
        super.filterCharacter(name: name, status: status, gender: gender));
  }

  late final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase', context: context);

  @override
  dynamic changeSearchBar() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.changeSearchBar');
    try {
      return super.changeSearchBar();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listCharacterModel: ${listCharacterModel},
searchBar: ${searchBar},
nextPageUrl: ${nextPageUrl}
    ''';
  }
}
