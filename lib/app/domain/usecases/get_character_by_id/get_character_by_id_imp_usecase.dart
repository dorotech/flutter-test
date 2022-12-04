import 'package:flutter_modular/flutter_modular.dart';
import 'package:rickandmorty/app/domain/models/dtos/character/character_dto.dart';
import 'package:rickandmorty/app/domain/repositories/get_character_by_id/get_character_by_id_repository.dart';
import 'get_character_by_id_usecase.dart';

final $GetCharacterByIdImpUsecase = BindInject(
  (i) => GetCharacterByIdImpUsecase(i.get()),
  isSingleton: true,
  isLazy: true,
);

class GetCharacterByIdImpUsecase implements GetCharacterByIdUsecase {
  final GetCharacterByIdRepository _getCharacterByIdRepository;

  GetCharacterByIdImpUsecase(this._getCharacterByIdRepository);

  @override
  Future<CharacterDto> call(int id) async {
    return await _getCharacterByIdRepository(id);
  }
}
