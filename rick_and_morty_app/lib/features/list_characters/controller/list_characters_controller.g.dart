// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_characters_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListCharactersController on ListCharactersControllerBase, Store {
  late final _$listCharacterAtom = Atom(
      name: 'ListCharactersControllerBase.listCharacter', context: context);

  @override
  ListCharacter? get listCharacter {
    _$listCharacterAtom.reportRead();
    return super.listCharacter;
  }

  @override
  set listCharacter(ListCharacter? value) {
    _$listCharacterAtom.reportWrite(value, super.listCharacter, () {
      super.listCharacter = value;
    });
  }

  late final _$characterFavoritesAtom = Atom(
      name: 'ListCharactersControllerBase.characterFavorites',
      context: context);

  @override
  List<Character> get characterFavorites {
    _$characterFavoritesAtom.reportRead();
    return super.characterFavorites;
  }

  @override
  set characterFavorites(List<Character> value) {
    _$characterFavoritesAtom.reportWrite(value, super.characterFavorites, () {
      super.characterFavorites = value;
    });
  }

  late final _$showFavoriteAtom =
      Atom(name: 'ListCharactersControllerBase.showFavorite', context: context);

  @override
  bool get showFavorite {
    _$showFavoriteAtom.reportRead();
    return super.showFavorite;
  }

  @override
  set showFavorite(bool value) {
    _$showFavoriteAtom.reportWrite(value, super.showFavorite, () {
      super.showFavorite = value;
    });
  }

  late final _$getListCharactersAsyncAction = AsyncAction(
      'ListCharactersControllerBase.getListCharacters',
      context: context);

  @override
  Future<dynamic> getListCharacters() {
    return _$getListCharactersAsyncAction.run(() => super.getListCharacters());
  }

  late final _$initCharactersFavoritesAsyncAction = AsyncAction(
      'ListCharactersControllerBase.initCharactersFavorites',
      context: context);

  @override
  Future<dynamic> initCharactersFavorites() {
    return _$initCharactersFavoritesAsyncAction
        .run(() => super.initCharactersFavorites());
  }

  late final _$setCharacterLoverAsyncAction = AsyncAction(
      'ListCharactersControllerBase.setCharacterLover',
      context: context);

  @override
  Future<dynamic> setCharacterLover(Character character) {
    return _$setCharacterLoverAsyncAction
        .run(() => super.setCharacterLover(character));
  }

  @override
  String toString() {
    return '''
listCharacter: ${listCharacter},
characterFavorites: ${characterFavorites},
showFavorite: ${showFavorite}
    ''';
  }
}
