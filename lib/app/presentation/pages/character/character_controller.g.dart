// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterController on _CharacterControllerBase, Store {
  late final _$loadingAtom =
      Atom(name: '_CharacterControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$listCharactersAtom =
      Atom(name: '_CharacterControllerBase.listCharacters', context: context);

  @override
  List<CharacterDto>? get listCharacters {
    _$listCharactersAtom.reportRead();
    return super.listCharacters;
  }

  @override
  set listCharacters(List<CharacterDto>? value) {
    _$listCharactersAtom.reportWrite(value, super.listCharacters, () {
      super.listCharacters = value;
    });
  }

  late final _$getCharactersAsyncAction =
      AsyncAction('_CharacterControllerBase.getCharacters', context: context);

  @override
  Future<ResultPresentation> getCharacters({String? query}) {
    return _$getCharactersAsyncAction
        .run(() => super.getCharacters(query: query));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
listCharacters: ${listCharacters}
    ''';
  }
}
