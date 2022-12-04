import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rickandmorty/app/domain/models/dtos/character/character_dto.dart';
import 'package:rickandmorty/app/domain/models/exceptions/exception.dart';
import 'package:rickandmorty/app/domain/models/presentation/result_presentation.dart';
import 'package:rickandmorty/app/domain/usecases/get_character/get_character_usecase.dart';

part 'character_controller.g.dart';

final $CharacterController = BindInject(
  (i) => CharacterController(i()),
  isSingleton: true,
  isLazy: true,
);

class CharacterController = _CharacterControllerBase with _$CharacterController;

abstract class _CharacterControllerBase with Store {
  final GetCharacterUsecase _characterUsecase;

  _CharacterControllerBase(this._characterUsecase);

  @observable
  bool loading = false;

  @observable
  List<CharacterDto>? listCharacters;

  //Query parameters
  @observable
  List<Widget> genders = const [Text('Male'), Text('Female'), Text('Unknown')];

  @observable
  List<Widget> status = const [Text('Alive'), Text('Dead'), Text('Unknown')];

  @observable
  List<bool> selectedGenders = <bool>[false, false, false];

  @observable
  List<bool> selectedStatus = <bool>[false, false, false];

  @observable
  TextEditingController nameController = TextEditingController();

  @observable
  TextEditingController speciesController = TextEditingController();

  @observable
  String? nameQuery;

  @observable
  String? speciesQuery;

  @observable
  String? genderQuery;

  @observable
  String? statusQuery;

  @observable
  int page = 1;

  @action
  void setPage(int value) => page = value;
  //

  @observable
  int paginationSize = 20;

  @observable
  bool isFiltered = false;

  @observable
  bool isFilterOpen = false;

  @action
  void setIsFiltered(bool value) => isFiltered = value;

  @action
  void setIsFilterOpen(bool value) => isFilterOpen = value;

  @action
  void setPaginationSize(int value) => paginationSize = value;

  @action
  Future<ResultPresentation> getCharacters() async {
    try {
      loading = true;

      listCharacters = await _characterUsecase(
          "page=$page&$nameQuery&$statusQuery&$genderQuery&$speciesQuery");
      loading = false;
      return ResultPresentation(payload: listCharacters);
    } on RMException catch (e) {
      loading = false;
      listCharacters = null;
      return ResultPresentation(error: e.error ?? '', message: e.message);
    }
  }
}
