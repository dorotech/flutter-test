import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rickandmorty/app/domain/models/dtos/character/character_dto.dart';

class CharacterDetailsPage extends StatefulWidget {
  final CharacterDto character;

  const CharacterDetailsPage({Key? key, required this.character})
      : super(key: key);

  @override
  State<CharacterDetailsPage> createState() => _CharacterDetailsPageState();
}

class _CharacterDetailsPageState extends State<CharacterDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
