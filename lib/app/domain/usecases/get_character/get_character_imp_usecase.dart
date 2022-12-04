import 'package:flutter_modular/flutter_modular.dart';
import 'package:rickandmorty/app/domain/models/dtos/character/character_dto.dart';
import 'package:rickandmorty/app/domain/repositories/get_character/get_character_repository.dart';
import 'get_character_usecase.dart';

final $GetCharacterImpUsecase = BindInject(
  (i) => GetCharacterImpUsecase(i.get()),
  isSingleton: true,
  isLazy: true,
);

class GetCharacterImpUsecase implements GetCharacterUsecase {
  final GetCharacterRepository _getCharacterRepository;

  GetCharacterImpUsecase(this._getCharacterRepository);

  @override
  Future<List<CharacterDto>?> call(String? query) async {
    return await _getCharacterRepository(query);
  }
}
