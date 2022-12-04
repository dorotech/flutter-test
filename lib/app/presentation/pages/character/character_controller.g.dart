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

  late final _$gendersAtom =
      Atom(name: '_CharacterControllerBase.genders', context: context);

  @override
  List<Widget> get genders {
    _$gendersAtom.reportRead();
    return super.genders;
  }

  @override
  set genders(List<Widget> value) {
    _$gendersAtom.reportWrite(value, super.genders, () {
      super.genders = value;
    });
  }

  late final _$statusAtom =
      Atom(name: '_CharacterControllerBase.status', context: context);

  @override
  List<Widget> get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(List<Widget> value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$selectedGendersAtom =
      Atom(name: '_CharacterControllerBase.selectedGenders', context: context);

  @override
  List<bool> get selectedGenders {
    _$selectedGendersAtom.reportRead();
    return super.selectedGenders;
  }

  @override
  set selectedGenders(List<bool> value) {
    _$selectedGendersAtom.reportWrite(value, super.selectedGenders, () {
      super.selectedGenders = value;
    });
  }

  late final _$selectedStatusAtom =
      Atom(name: '_CharacterControllerBase.selectedStatus', context: context);

  @override
  List<bool> get selectedStatus {
    _$selectedStatusAtom.reportRead();
    return super.selectedStatus;
  }

  @override
  set selectedStatus(List<bool> value) {
    _$selectedStatusAtom.reportWrite(value, super.selectedStatus, () {
      super.selectedStatus = value;
    });
  }

  late final _$nameControllerAtom =
      Atom(name: '_CharacterControllerBase.nameController', context: context);

  @override
  TextEditingController get nameController {
    _$nameControllerAtom.reportRead();
    return super.nameController;
  }

  @override
  set nameController(TextEditingController value) {
    _$nameControllerAtom.reportWrite(value, super.nameController, () {
      super.nameController = value;
    });
  }

  late final _$speciesControllerAtom = Atom(
      name: '_CharacterControllerBase.speciesController', context: context);

  @override
  TextEditingController get speciesController {
    _$speciesControllerAtom.reportRead();
    return super.speciesController;
  }

  @override
  set speciesController(TextEditingController value) {
    _$speciesControllerAtom.reportWrite(value, super.speciesController, () {
      super.speciesController = value;
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

  late final _$speciesQueryAtom =
      Atom(name: '_CharacterControllerBase.speciesQuery', context: context);

  @override
  String? get speciesQuery {
    _$speciesQueryAtom.reportRead();
    return super.speciesQuery;
  }

  @override
  set speciesQuery(String? value) {
    _$speciesQueryAtom.reportWrite(value, super.speciesQuery, () {
      super.speciesQuery = value;
    });
  }

  late final _$genderQueryAtom =
      Atom(name: '_CharacterControllerBase.genderQuery', context: context);

  @override
  String? get genderQuery {
    _$genderQueryAtom.reportRead();
    return super.genderQuery;
  }

  @override
  set genderQuery(String? value) {
    _$genderQueryAtom.reportWrite(value, super.genderQuery, () {
      super.genderQuery = value;
    });
  }

  late final _$statusQueryAtom =
      Atom(name: '_CharacterControllerBase.statusQuery', context: context);

  @override
  String? get statusQuery {
    _$statusQueryAtom.reportRead();
    return super.statusQuery;
  }

  @override
  set statusQuery(String? value) {
    _$statusQueryAtom.reportWrite(value, super.statusQuery, () {
      super.statusQuery = value;
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

  late final _$isFilteredAtom =
      Atom(name: '_CharacterControllerBase.isFiltered', context: context);

  @override
  bool get isFiltered {
    _$isFilteredAtom.reportRead();
    return super.isFiltered;
  }

  @override
  set isFiltered(bool value) {
    _$isFilteredAtom.reportWrite(value, super.isFiltered, () {
      super.isFiltered = value;
    });
  }

  late final _$isFilterOpenAtom =
      Atom(name: '_CharacterControllerBase.isFilterOpen', context: context);

  @override
  bool get isFilterOpen {
    _$isFilterOpenAtom.reportRead();
    return super.isFilterOpen;
  }

  @override
  set isFilterOpen(bool value) {
    _$isFilterOpenAtom.reportWrite(value, super.isFilterOpen, () {
      super.isFilterOpen = value;
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
  void setIsFiltered(bool value) {
    final _$actionInfo = _$_CharacterControllerBaseActionController.startAction(
        name: '_CharacterControllerBase.setIsFiltered');
    try {
      return super.setIsFiltered(value);
    } finally {
      _$_CharacterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsFilterOpen(bool value) {
    final _$actionInfo = _$_CharacterControllerBaseActionController.startAction(
        name: '_CharacterControllerBase.setIsFilterOpen');
    try {
      return super.setIsFilterOpen(value);
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
genders: ${genders},
status: ${status},
selectedGenders: ${selectedGenders},
selectedStatus: ${selectedStatus},
nameController: ${nameController},
speciesController: ${speciesController},
nameQuery: ${nameQuery},
speciesQuery: ${speciesQuery},
genderQuery: ${genderQuery},
statusQuery: ${statusQuery},
page: ${page},
paginationSize: ${paginationSize},
isFiltered: ${isFiltered},
isFilterOpen: ${isFilterOpen}
    ''';
  }
}
