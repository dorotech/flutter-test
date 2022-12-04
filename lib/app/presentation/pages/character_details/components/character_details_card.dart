import 'package:flutter/material.dart';
import 'package:rickandmorty/app/domain/models/dtos/character/character_dto.dart';
import 'package:rickandmorty/app/presentation/components/status_badge.dart';

class CharacterDetailsCard extends StatelessWidget {
  final CharacterDto characterDto;

  const CharacterDetailsCard({Key? key, required this.characterDto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 14,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.network(
                    characterDto.image,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name: ${characterDto.name}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 22,
                        ),
                        softWrap: true,
                        maxLines: 5,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Status: ",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 22,
                            ),
                            softWrap: true,
                            maxLines: 5,
                          ),
                          StatusBadge(
                            background: _getBadgeColor().withOpacity(0.1),
                            text: characterDto.status,
                            textColor: _getBadgeColor(),
                            icon: 'assets/status_icon.png',
                            iconColor: _getBadgeColor(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Species: ${characterDto.species}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 22,
                        ),
                        softWrap: true,
                        maxLines: 5,
                      ),
                      if (characterDto.type.isNotEmpty)
                        const SizedBox(
                          height: 10,
                        ),
                      if (characterDto.type.isNotEmpty)
                        Text(
                          "Type: ${characterDto.type}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                          ),
                          softWrap: true,
                          maxLines: 5,
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Gender: ${characterDto.gender}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 22,
                        ),
                        softWrap: true,
                        maxLines: 5,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Origin: ${characterDto.origin.name}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 22,
                        ),
                        softWrap: true,
                        maxLines: 5,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Location: ${characterDto.location.name}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 22,
                        ),
                        softWrap: true,
                        maxLines: 5,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Number of episodes: ${characterDto.episode.length}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 22,
                        ),
                        softWrap: true,
                        maxLines: 5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Color _getBadgeColor() {
    switch (characterDto.status) {
      case "Alive":
        return Colors.green;
      case "Dead":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
