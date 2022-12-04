import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
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
  final RefreshController _refreshController = RefreshController(
    initialRefreshStatus: RefreshStatus.idle,
  );

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
              if (_controller.isFilterOpen)
                Column(
                  children: [
                    _buildNameSearch(),
                    _buildSpeciesSearch(),
                    _buildGenderSelect(),
                    _buildStatusSelect(),
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
                            child: SmartRefresher(
                              header: const WaterDropMaterialHeader(
                                backgroundColor: Colors.white,
                                color: Colors.blueAccent,
                              ),
                              controller: _refreshController,
                              onRefresh: () => _onRefresh(context),
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: _getPaginationSize(),
                                itemBuilder: ((context, index) => _buildCard(
                                    _controller.listCharacters![index])),
                              ),
                            ),
                          )
                        : const SingleChildScrollView(
                            child: Center(
                              child: EmptyData(
                                title: "Nenhum personagem encontrado!",
                                message: "tente mudar os filtros.",
                              ),
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

  Widget _buildNameSearch() {
    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
              _controller.setIsFiltered(true);
            } else if (value.isEmpty) {
              _controller.nameQuery = null;
              _controller.getCharacters();
              _verifyFilters();
            }
          }),
        ),
      );
    });
  }

  Widget _buildSpeciesSearch() {
    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: TextField(
          controller: _controller.speciesController,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            labelText: 'Filtrar por espécie',
            labelStyle: TextStyle(fontSize: 16),
            border: OutlineInputBorder(),
          ),
          onChanged: ((value) {
            if (value.length > 3) {
              _controller.speciesQuery = "species=$value";
              _controller.getCharacters();
              _controller.setIsFiltered(true);
            } else if (value.isEmpty) {
              _controller.speciesQuery = null;
              _controller.getCharacters();
              _verifyFilters();
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
          onTap: () => _controller.isFilterOpen = !_controller.isFilterOpen,
        ),
      );
    });
  }

  Widget _buildGenderSelect() {
    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Gender:',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            ToggleButtons(
              direction: Axis.horizontal,
              onPressed: (int index) {
                setState(() {
                  switch (index) {
                    case 0:
                      _controller.selectedGenders[index] =
                          !_controller.selectedGenders[index];
                      _controller.selectedGenders[1] = false;
                      _controller.selectedGenders[2] = false;
                      if (_controller.selectedGenders[index] == true) {
                        _controller.genderQuery = "gender=male";
                        _controller.getCharacters();
                        _controller.setIsFiltered(true);
                      } else {
                        _controller.genderQuery = null;
                        _controller.getCharacters();
                        _verifyFilters();
                      }
                      break;
                    case 1:
                      _controller.selectedGenders[index] =
                          !_controller.selectedGenders[index];
                      _controller.selectedGenders[0] = false;
                      _controller.selectedGenders[2] = false;
                      if (_controller.selectedGenders[index] == true) {
                        _controller.genderQuery = "gender=female";
                        _controller.getCharacters();
                        _controller.setIsFiltered(true);
                      } else {
                        _controller.genderQuery = null;
                        _controller.getCharacters();
                        _verifyFilters();
                      }
                      break;
                    case 2:
                      _controller.selectedGenders[index] =
                          !_controller.selectedGenders[index];
                      _controller.selectedGenders[1] = false;
                      _controller.selectedGenders[0] = false;
                      if (_controller.selectedGenders[index] == true) {
                        _controller.genderQuery = "gender=unknown";
                        _controller.getCharacters();
                        _controller.setIsFiltered(true);
                      } else {
                        _controller.genderQuery = null;
                        _controller.getCharacters();
                        _verifyFilters();
                      }
                      break;
                  }
                });
              },
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              selectedBorderColor: Colors.blue[700],
              selectedColor: Colors.white,
              fillColor: Colors.blue[200],
              color: Colors.black,
              constraints: const BoxConstraints(
                minHeight: 40,
                minWidth: 80,
              ),
              isSelected: _controller.selectedGenders,
              children: _controller.genders,
            ),
          ],
        ),
      );
    });
  }

  Widget _buildStatusSelect() {
    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Status: ',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            ToggleButtons(
              direction: Axis.horizontal,
              onPressed: (int index) {
                setState(() {
                  switch (index) {
                    case 0:
                      _controller.selectedStatus[index] =
                          !_controller.selectedStatus[index];
                      _controller.selectedStatus[1] = false;
                      _controller.selectedStatus[2] = false;
                      if (_controller.selectedStatus[index] == true) {
                        _controller.statusQuery = "status=alive";
                        _controller.getCharacters();
                        _controller.setIsFiltered(true);
                      } else {
                        _controller.statusQuery = null;
                        _controller.getCharacters();
                        _verifyFilters();
                      }
                      break;
                    case 1:
                      _controller.selectedStatus[index] =
                          !_controller.selectedStatus[index];
                      _controller.selectedStatus[0] = false;
                      _controller.selectedStatus[2] = false;
                      if (_controller.selectedStatus[index] == true) {
                        _controller.statusQuery = "status=dead";
                        _controller.getCharacters();
                        _controller.setIsFiltered(true);
                      } else {
                        _controller.statusQuery = null;
                        _controller.getCharacters();
                        _verifyFilters();
                      }
                      break;
                    case 2:
                      _controller.selectedStatus[index] =
                          !_controller.selectedStatus[index];
                      _controller.selectedStatus[1] = false;
                      _controller.selectedStatus[0] = false;
                      if (_controller.selectedStatus[index] == true) {
                        _controller.statusQuery = "status=unknown";
                        _controller.getCharacters();
                        _controller.setIsFiltered(true);
                      } else {
                        _controller.statusQuery = null;
                        _controller.getCharacters();
                        _verifyFilters();
                      }
                      break;
                  }
                });
              },
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              selectedBorderColor: Colors.blue[700],
              selectedColor: Colors.white,
              fillColor: Colors.blue[200],
              color: Colors.black,
              constraints: const BoxConstraints(
                minHeight: 40,
                minWidth: 80,
              ),
              isSelected: _controller.selectedStatus,
              children: _controller.status,
            ),
          ],
        ),
      );
    });
  }

  Widget _buildPagination() {
    int paginationSize;
    if (_controller.listCharacters == null) {
      paginationSize = 0;
    } else if (_controller.paginationSize >
        _controller.listCharacters!.length) {
      paginationSize = _controller.listCharacters!.length;
    } else {
      paginationSize = _controller.paginationSize;
    }
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'Page ${_controller.page}: Showing $paginationSize of ${_controller.listCharacters?.length ?? 0} results',
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

  _verifyFilters() {
    if (_controller.nameQuery == null &&
        _controller.genderQuery == null &&
        _controller.statusQuery == null &&
        _controller.speciesQuery == null) {
      _controller.setIsFiltered(false);
    }
  }

  void Function()? _onRefresh(BuildContext context) {
    _controller.getCharacters();
    _refreshController.refreshCompleted();
  }
}
