import 'package:rickandmorty/app/domain/models/dtos/character/character_dto.dart';

abstract class GetCharacterDatasource {
  Future<List<CharacterDto>?> call();
}
