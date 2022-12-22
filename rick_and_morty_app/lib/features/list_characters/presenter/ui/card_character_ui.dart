import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../core/core.dart';

class CardCharacter extends StatelessWidget {
  const CardCharacter({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

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
                  onPressed: () {},
                  icon: const Icon(
                    MdiIcons.heartOutline,
                  ),
                ),
              ],
            ),
          ),
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
    );
  }
}
