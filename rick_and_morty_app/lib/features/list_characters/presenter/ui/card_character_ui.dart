import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rick_and_morty_app/features/list_characters/controller/list_characters_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/core.dart';
import '../../../details_characters/presenter/details_chatacter_presenter.dart';

class CardCharacter extends StatelessWidget {
  const CardCharacter({
    Key? key,
    required this.character,
    required this.controller,
  }) : super(key: key);

  final Character character;
  final ListCharactersController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    character.name ?? "",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Regular",
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await controller.setCharacterLover(character);
                  },
                  icon: Observer(builder: (_) {
                    return Icon(
                      controller.characterIsInFavorite(character) ? MdiIcons.heart : MdiIcons.heartOutline,
                      color: controller.characterIsInFavorite(character) ? Colors.red : null,
                    );
                  }),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => DetailsCharacterPresenter(
                      character: character,
                    ),
                  ));
            },
            child: Image.network(
              character.image ?? "",
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error, size: 200);
              },
            ),
          ),
        ],
      ),
    );
  }
}
