import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rick_and_morty_app/core/core.dart';

class DetailsCharacterPresenter extends StatelessWidget {
  const DetailsCharacterPresenter({
    Key? key,
    required this.character,
  }) : super(key: key);
  final Character character;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: TextTitle(character.name ?? "Desconhecido")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InteractiveViewer(
                    child: Image.network(
                      character.image ?? "",
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error, size: 200);
                      },
                    ),
                  ),
                ],
              ),
            ),
            _infomation(details: "Origen", value: character.origin?.name),
            _infomation(details: "Localização", value: character.location?.name),
            _infomation(details: "Status", value: character.status?.name),
            _infomation(details: "Genero", value: genderValues.reverse?[character.gender]),
            _infomation(details: "Especie", value: character.species?.name),
          ],
        ),
      ),
    );
  }

  Widget _infomation({required String details, dynamic value}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Visibility(
        visible: value != null,
        child: Column(
          children: [
            TextTitle("$details:\n  ${value ?? ""}"),
          ],
        ),
      ),
    );
  }
}
