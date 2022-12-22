import 'package:flutter/foundation.dart';

import '../../../core/core.dart';
import '../repository/repository.dart';

class ListCharactersController {
  IListCharactersRepository listCharactersRepository = ListCharactersRepository();
  ListCharacter? listCharacter;

  Future getListCharacters() async {
    String data = await listCharactersRepository.getListChatactersRepository();
    try {
      listCharacter = listCharacterFromJson(data);
      return listCharacter;
    } catch (e) {
      if (kDebugMode) print(e.toString());
      throw DefalutStrings.unknownError;
    }
  }
}
