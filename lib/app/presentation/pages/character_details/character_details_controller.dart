import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rickandmorty/app/domain/models/dtos/character/character_dto.dart';
import 'package:rickandmorty/app/domain/models/exceptions/exception.dart';
import 'package:rickandmorty/app/domain/models/presentation/result_presentation.dart';
import 'package:rickandmorty/app/domain/usecases/get_character_by_id/get_character_by_id_usecase.dart';

part 'character_details_controller.g.dart';

final $CharacterDetailsController = BindInject(
  (i) => CharacterDetailsController(i()),
  isSingleton: true,
  isLazy: true,
);

class CharacterDetailsController = _CharacterDetailsControllerBase
    with _$CharacterDetailsController;

abstract class _CharacterDetailsControllerBase with Store {
  final GetCharacterByIdUsecase _characterByIdUsecase;

  _CharacterDetailsControllerBase(this._characterByIdUsecase);

  @observable
  bool loading = false;

  @observable
  int? characterId;

  @observable
  CharacterDto? characterDto;

  Future<ResultPresentation> getCharacterById() async {
    try {
      loading = true;
      characterDto = await _characterByIdUsecase(characterId!);
      loading = false;
      return ResultPresentation(payload: characterDto);
    } on RMException catch (e) {
      loading = false;
      return ResultPresentation(error: e.error ?? '', message: e.message);
    }
  }
}
