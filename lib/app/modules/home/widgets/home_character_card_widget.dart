import 'package:dorotech_test/app/common/models/character_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () async {
        Modular.to.navigate(
          '/detail/',
          arguments: widget.character,
        );
      },
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Stack(
          children: [
            Container(
              child: Image.network(
                widget.character.image!,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: size.width,
                height: size.height * 0.05,
                color: Colors.black.withOpacity(0.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: size.width * 0.35,
                      child: Text(
                        widget.character.name!,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Icon(
                      Icons.circle,
                      size: 14,
                      color: widget.character.status! == "Alive"
                          ? Colors.green
                          : Colors.red,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
