import 'package:flutter/foundation.dart';
import 'package:rick_and_morty_app/features/list_characters/data/data.dart';

import '../../../core/core.dart';
import '../repository/repository.dart';

class ListCharactersController {
  IListCharactersRepository listCharactersRepository = ListCharactersRepository();
  ListCharacter? listCharacter;
  FilterInputs? filterInputs;

  Future getListCharacters() async {
    String data = await listCharactersRepository.getListChatactersRepository(
      gender: filterInputs?.gender,
      name: filterInputs?.name,
      species: filterInputs?.species,
      status: filterInputs?.status,
    );
    try {
      listCharacter = listCharacterFromJson(data);
      return listCharacter;
    } catch (e) {
      if (kDebugMode) print(e.toString());
      throw DefalutStrings.unknownError;
    }
  }
}
