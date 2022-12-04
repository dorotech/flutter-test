import 'package:rickandmorty/app/domain/models/dtos/character/character_dto.dart';

abstract class GetCharacterByIdDatasource {
  Future<CharacterDto> call(int id);
}
