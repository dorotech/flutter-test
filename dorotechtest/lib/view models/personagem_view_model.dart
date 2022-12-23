import 'package:dorotechtest/models/personagem.dart';

class PersonagemViewModel {
  final PersonagemModel personagem;

  PersonagemViewModel({required this.personagem});

  String? get name {
    return personagem.name;
  }

  String? get status {
    return personagem.status;
  }

  String? get image {
    return personagem.image;
  }
}
