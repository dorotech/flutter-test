import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rickandmorty/app/domain/models/dtos/character/character_dto.dart';
import 'package:rickandmorty/app/presentation/pages/character_details/character_details_controller.dart';
import 'package:rickandmorty/app/presentation/pages/character_details/components/character_details_card.dart';

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
      appBar: _buildAppBar(),
      body: Observer(builder: (context) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: CharacterDetailsCard(
                      characterDto:
                          _controller.characterDto ?? widget.character),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 24, top: 10, bottom: 10),
        child: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
      ),
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: SizedBox(
          width: 150, child: Image.asset('assets/rickandmorty_logo.png')),
    );
  }
}
