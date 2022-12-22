import 'package:dorotech_test/app/common/models/character_model.dart';
import 'package:flutter/material.dart';

class HomeCharacterCardWidget extends StatefulWidget {
  final CharacterModel character;
  const HomeCharacterCardWidget({super.key, required this.character});

  @override
  State<HomeCharacterCardWidget> createState() =>
      _HomeCharacterCardWidgetState();
}

class _HomeCharacterCardWidgetState extends State<HomeCharacterCardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () async {
      //   final pokemonData = await homeController.getPokemonByName(
      //       context: context, name: widget.pokemon.name!);

      //   Modular.to.navigate(
      //     '/detail/',
      //     arguments: pokemonData,
      //   );
      // },
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: LayoutBuilder(
          builder: (_, constraints) => IntrinsicHeight(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: constraints.maxHeight * 0.05),
                  child: Container(
                    height: constraints.maxHeight * 0.8,
                    child: Center(
                      child: Image.network(widget.character.image!),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding:
                        EdgeInsets.only(bottom: constraints.maxHeight * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          widget.character.name!,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Icon(
                          Icons.circle,
                          size: 16,
                          color: widget.character.status! == "Alive"
                              ? Colors.green
                              : Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
