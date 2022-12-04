import 'package:rickandmorty/app/domain/models/dtos/character/character_dto.dart';

abstract class GetCharacterUsecase {
  Future<List<CharacterDto>?> call(String? query);
}
