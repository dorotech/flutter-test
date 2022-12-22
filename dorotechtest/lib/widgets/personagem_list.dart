import 'package:dorotechtest/view%20models/personagem_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PersonagemList extends StatelessWidget {
  final List<PersonagemViewModel> personagem;
  const PersonagemList({super.key, required this.personagem});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.personagem.length,
      itemBuilder: (context, index) {
        final persona = this.personagem[index];

        return ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(persona.personagem.image!)),
                borderRadius: BorderRadius.circular(6)),
            width: 50,
            height: 100,
          ),
          title: Text(persona.personagem.name!),
        );
      },
    );
  }
}
