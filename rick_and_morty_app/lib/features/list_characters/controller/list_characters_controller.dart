import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:rick_and_morty_app/features/list_characters/data/data.dart';

import '../../../core/core.dart';
import '../repository/repository.dart';

part 'list_characters_controller.g.dart';

class ListCharactersController = ListCharactersControllerBase with _$ListCharactersController;

abstract class ListCharactersControllerBase with Store {
  IListCharactersRepository listCharactersRepository = ListCharactersRepository();
  CacheModel characterFavoriteCache = CharacterFavoriteCache();
  FilterInputs? filterInputs;

  @observable
  ListCharacter listCharacter = ListCharacter();
  @observable
  List<Character> characterFavorites = [];
  @observable
  bool showFavorite = false;

  @action
  Future getListCharacters() async {
    if (showFavorite) {
      listCharacter.results = characterFavorites;
      return listCharacter;
    }

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

  @action
  Future initCharactersFavorites() async {
    CharacterFavorite characterFavorite = await characterFavoriteCache.getModel();
    characterFavorites = characterFavorite.listCharacter ?? [];
  }

  @action
  Future setCharacterLover(Character character) async {
    CharacterFavorite? cache = await characterFavoriteCache.getModel();
    try {
      if (characterIsInFavorite(character)) {
        cache?.listCharacter?.removeWhere((element) => element.id == character.id);
      } else {
        cache?.listCharacter?.add(character);
      }

      await characterFavoriteCache.setModel(cache);
      characterFavorites = cache?.listCharacter ?? [];
    } catch (e) {
      if (kDebugMode) print(e.toString());
    }
  }

  bool characterIsInFavorite(Character character) {
    bool exist = false;
    for (var characterFavorite in characterFavorites) {
      if (characterFavorite.id == character.id) {
        exist = true;
        break;
      }
    }
    return exist;
  }
}
