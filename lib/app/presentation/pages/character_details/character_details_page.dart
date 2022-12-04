import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rickandmorty/app/domain/models/dtos/character/character_dto.dart';
import 'package:rickandmorty/app/presentation/pages/character_details/character_details_controller.dart';

class CharacterDetailsPage extends StatefulWidget {
  final CharacterDto character;

  const CharacterDetailsPage({Key? key, required this.character})
      : super(key: key);

  @override
  State<CharacterDetailsPage> createState() => _CharacterDetailsPageState();
}

class _CharacterDetailsPageState extends State<CharacterDetailsPage> {
  final _controller = Modular.get<CharacterDetailsController>();

  @override
  void initState() {
    _controller.setCharacterId(widget.character.id);
    _controller.setCharacterDto(widget.character);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Observer(builder: (context) {
        return SafeArea(
          child: Column(
            children: [
              Image.network(_controller.characterDto!.image),
              Text(_controller.characterDto!.name),
              Text(_controller.characterDto!.status)
            ],
          ),
        );
      }),
    );
  }
}
