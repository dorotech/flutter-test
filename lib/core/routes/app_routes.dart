import 'package:flutter_modular/flutter_modular.dart';
import 'package:rickandmorty/app/domain/models/dtos/character/character_dto.dart';

class AppRouters {
  static goToCharacters() async {
    return Modular.to.pushNamed('/');
  }

  static goToCharactersDetails({required CharacterDto characterDto}) async {
    return Modular.to.pushNamed('/character/details', arguments: {
      'character': characterDto,
    });
  }

  AppRouters._();
}
