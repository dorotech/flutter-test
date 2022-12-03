import 'package:rickandmorty/app/domain/models/dtos/character/character_dto.dart';

abstract class GetCharacterRepository {
  Future<List<CharacterDto>?> call();
}
