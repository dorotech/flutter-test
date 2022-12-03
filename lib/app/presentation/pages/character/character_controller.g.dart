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

  late final _$nameQueryAtom =
      Atom(name: '_CharacterControllerBase.nameQuery', context: context);

  @override
  String? get nameQuery {
    _$nameQueryAtom.reportRead();
    return super.nameQuery;
  }

  @override
  set nameQuery(String? value) {
    _$nameQueryAtom.reportWrite(value, super.nameQuery, () {
      super.nameQuery = value;
    });
  }

  late final _$pageAtom =
      Atom(name: '_CharacterControllerBase.page', context: context);

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$paginationSizeAtom =
      Atom(name: '_CharacterControllerBase.paginationSize', context: context);

  @override
  int get paginationSize {
    _$paginationSizeAtom.reportRead();
    return super.paginationSize;
  }

  @override
  set paginationSize(int value) {
    _$paginationSizeAtom.reportWrite(value, super.paginationSize, () {
      super.paginationSize = value;
    });
  }

  late final _$getCharactersAsyncAction =
      AsyncAction('_CharacterControllerBase.getCharacters', context: context);

  @override
  Future<ResultPresentation> getCharacters() {
    return _$getCharactersAsyncAction.run(() => super.getCharacters());
  }

  late final _$_CharacterControllerBaseActionController =
      ActionController(name: '_CharacterControllerBase', context: context);

  @override
  void setPage(int value) {
    final _$actionInfo = _$_CharacterControllerBaseActionController.startAction(
        name: '_CharacterControllerBase.setPage');
    try {
      return super.setPage(value);
    } finally {
      _$_CharacterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPaginationSize(int value) {
    final _$actionInfo = _$_CharacterControllerBaseActionController.startAction(
        name: '_CharacterControllerBase.setPaginationSize');
    try {
      return super.setPaginationSize(value);
    } finally {
      _$_CharacterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
listCharacters: ${listCharacters},
nameQuery: ${nameQuery},
page: ${page},
paginationSize: ${paginationSize}
    ''';
  }
}