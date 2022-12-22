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

  late final _$getCharactersAsyncAction =
      AsyncAction('HomeControllerBase.getCharacters', context: context);

  @override
  Future<List<CharacterModel>> getCharacters() {
    return _$getCharactersAsyncAction.run(() => super.getCharacters());
  }

  @override
  String toString() {
    return '''
listCharacterModel: ${listCharacterModel}
    ''';
  }
}
