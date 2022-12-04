import 'package:flutter/material.dart';
import 'package:rickandmorty/app/domain/models/dtos/character/character_dto.dart';
import 'package:rickandmorty/app/presentation/components/status_badge.dart';

class CharacterCard extends StatelessWidget {
  final CharacterDto characterDto;
  final Function()? onTap;

  const CharacterCard({Key? key, required this.characterDto, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: InkWell(
            onTap: onTap,
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
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Text(
                                characterDto.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 22,
                                ),
                                softWrap: true,
                                maxLines: 5,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 70,
                      height: 70,
                      child: Image.network(characterDto.image),
                    ),
                  ],
                ),
              ),
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
