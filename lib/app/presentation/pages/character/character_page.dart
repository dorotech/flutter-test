import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rickandmorty/app/domain/models/dtos/character/character_dto.dart';
import 'package:rickandmorty/app/presentation/pages/character/character_controller.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  final _controller = Modular.get<CharacterController>();

  @override
  void initState() {
    _handleRequests();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (context) {
        return Container(
          child: _controller.listCharacters != null
              ? ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: _controller.paginationSize,
                  itemBuilder: ((context, index) =>
                      _buildCard(_controller.listCharacters![index])),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        );
      }),
    );
  }

  Future<void> _handleRequests() async {
    _controller.getCharacters();
  }

  Widget _buildCard(CharacterDto characterDto) {
    return ListTile(
      leading: Image.network(characterDto.image),
      title: Text(characterDto.name),
      subtitle: Text("Status: ${characterDto.status}"),
    );
  }
}
