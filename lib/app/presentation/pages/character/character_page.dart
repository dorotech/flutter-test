import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rickandmorty/app/domain/models/dtos/character/character_dto.dart';
import 'package:rickandmorty/app/presentation/components/empty_data_widget.dart';
import 'package:rickandmorty/app/presentation/components/filter_button.dart';
import 'package:rickandmorty/app/presentation/pages/character/character_controller.dart';
import 'package:rickandmorty/app/presentation/pages/character/components/character_card.dart';
import 'package:rickandmorty/core/routes/app_routes.dart';

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
        return SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 150,
                      child: Image.asset('assets/rickandmorty_logo.png')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSelectPaginationSize(),
                  _buildFilterButton(),
                ],
              ),
              Expanded(
                child: _controller.loading == true
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : _controller.listCharacters != null
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: _getPaginationSize(),
                              itemBuilder: ((context, index) => _buildCard(
                                  _controller.listCharacters![index])),
                            ),
                          )
                        : const Center(
                            child: EmptyData(
                              title: "Nenhum personagem encontrado!",
                              message: "tente mudar os filtros.",
                            ),
                          ),
              ),
              _buildPagination(),
            ],
          ),
        );
      }),
    );
  }

  Future<void> _handleRequests() async {
    _controller.getCharacters();
  }

  Widget _buildCard(CharacterDto characterDto) {
    return CharacterCard(
      characterDto: characterDto,
      onTap: () => AppRouters.goToCharactersDetails(characterDto: characterDto),
    );
  }

  Widget _builNameSearch() {
    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(15),
        child: TextField(
          controller: _controller.nameController,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            labelText: 'Filtrar por nome',
            labelStyle: TextStyle(fontSize: 16),
            border: OutlineInputBorder(),
          ),
          onChanged: ((value) {
            if (value.length > 3) {
              _controller.nameQuery = "name=$value";
              _controller.getCharacters();
            } else if (value.isEmpty) {
              _controller.nameQuery = null;
              _controller.getCharacters();
            }
          }),
        ),
      );
    });
  }

  Widget _buildSelectPaginationSize() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          const Text("Results:"),
          const SizedBox(
            width: 10,
          ),
          Observer(builder: (context) {
            return DropdownButton(
              items: const [
                DropdownMenuItem<int>(
                  value: 5,
                  child: Text("5"),
                ),
                DropdownMenuItem<int>(
                  value: 10,
                  child: Text("10"),
                ),
                DropdownMenuItem<int>(
                  value: 20,
                  child: Text("20"),
                ),
              ],
              onChanged: (value) {
                _controller.setPaginationSize(value ?? 20);
              },
              value: _controller.paginationSize,
            );
          }),
        ],
      ),
    );
  }

  int _getPaginationSize() {
    if (_controller.listCharacters != null) {
      if (_controller.listCharacters!.length <= 5) {
        return _controller.listCharacters!.length;
      } else if (_controller.listCharacters!.length <= 10) {
        switch (_controller.paginationSize) {
          case 5:
            return _controller.paginationSize;
          default:
            return _controller.listCharacters!.length;
        }
      } else if (_controller.listCharacters!.length < 20) {
        switch (_controller.paginationSize) {
          case 5:
            return _controller.paginationSize;
          case 10:
            return _controller.paginationSize;
          default:
            return _controller.listCharacters!.length;
        }
      }
    }
    return _controller.paginationSize;
  }

  Widget _buildFilterButton() {
    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(15),
        child: FilterButton(
          isFiltered: _controller.isFiltered,
        ),
      );
    });
  }

  Widget _buildPagination() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'Page ${_controller.page}: Showing ${_controller.paginationSize} of ${_controller.listCharacters?.length} results',
            ),
          ),
          if (_controller.page > 1)
            IconButton(
              onPressed: () {
                _controller.setPage(_controller.page - 1);
                _controller.getCharacters();
              },
              icon: const Icon(Icons.arrow_back_ios),
              iconSize: 20,
            ),
          IconButton(
            onPressed: () {
              _controller.setPage(_controller.page + 1);
              _controller.getCharacters();
            },
            icon: const Icon(Icons.arrow_forward_ios),
            iconSize: 20,
          ),
        ],
      ),
    );
  }
}
