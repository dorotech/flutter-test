import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rick_and_morty_app/core/core.dart';
import 'package:rick_and_morty_app/features/list_characters/componets/componets.dart';
import 'package:rick_and_morty_app/features/list_characters/controller/controller.dart';
import 'package:rick_and_morty_app/features/list_characters/data/data.dart';
import 'package:rick_and_morty_app/features/list_characters/presenter/ui/ui.dart';

class ListCharactersPresenter extends StatefulWidget {
  const ListCharactersPresenter({super.key});

  @override
  State<ListCharactersPresenter> createState() => _ListCharactersPresenterState();
}

class _ListCharactersPresenterState extends State<ListCharactersPresenter> {
  final ListCharactersController _controller = ListCharactersController();
  @override
  void initState() {
    _controller.initCharactersFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rick and Morty"),
        actions: [
          IconButton(
            onPressed: () {
              _controller.showFavorite = !_controller.showFavorite;
              setState(() {});
            },
            icon: Icon(
              _controller.showFavorite ? MdiIcons.heart : MdiIcons.heartOutline,
              color: Colors.red,
            ),
            tooltip: "Exibir favoritos",
          ),
          Visibility(
            visible: !_controller.showFavorite,
            child: IconButton(
              onPressed: () async {
                dynamic filter = await Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => FilterUi(filterInputs: _controller.filterInputs),
                  ),
                );
                if (filter is FilterInputs) {
                  _controller.filterInputs = filter;
                }
                setState(() {});
              },
              icon: const Icon(MdiIcons.magnify),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
          future: _controller.getListCharacters(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (snapshot.hasData) {
              return _body();
            } else {
              if (_controller.listCharacter.results != null) {
                if (_controller.listCharacter.results!.isEmpty) {
                  return const Center(
                    child: Text("no data found"),
                  );
                }
              }
              return Center(
                child: Column(
                  children: [
                    Text(snapshot.error.toString()),
                    tryAgain(),
                  ],
                ),
              );
            }
          }),
    );
  }

  Widget tryAgain() {
    return ElevatedButton(
        onPressed: () {
          setState(() {});
        },
        child: Text(DefalutStrings.tryAgain));
  }

  Widget _body() {
    if (_controller.listCharacter.results?.isEmpty ?? true) {
      return Center(
        child: Text(_controller.showFavorite ? DefalutStrings.noFavorites : DefalutStrings.emptyList),
      );
    }
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
      },
      child: ListView.builder(
        itemCount: _controller.listCharacter.results?.length ?? 0,
        itemBuilder: (context, index) {
          Character character = _controller.listCharacter.results![index];
          return CardCharacter(character: character, controller: _controller);
        },
      ),
    );
  }
}
