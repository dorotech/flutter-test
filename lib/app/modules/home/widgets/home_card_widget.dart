import 'package:dorotech_test/app/modules/home/widgets/appbar/appbar_widget.dart';
import 'package:dorotech_test/app/modules/home/widgets/home_character_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../home_controller.dart';

class HomeCard extends StatefulWidget {
  final HomeController controller;
  const HomeCard({Key? key, required this.controller}) : super(key: key);

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  ScrollController? _scrollController;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(widget.controller.searchBar ? 170.0 : 56),
            child: Column(
              children: [
                AppbarWidget(),
                Visibility(
                  visible: widget.controller.searchBar,
                  child: Wrap(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: TextField(
                            onSubmitted: (String value) {
                              widget.controller.filterCharacter(
                                name: value,
                                status: widget.controller.selectedStatus,
                                gender: widget.controller.selectedGender,
                              );
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () {
                                  widget.controller.changeSearchBar();
                                  FocusScope.of(context).unfocus();
                                },
                              ),
                              hintText: 'Nome do personagem',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  icon:
                                      Icon(Icons.keyboard_arrow_down_outlined),
                                  value: widget.controller.selectedGender,
                                  isDense: true,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      widget.controller.selectedGender =
                                          newValue!;
                                    });
                                  },
                                  items: widget.controller.genders.map(
                                    (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                              DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  icon:
                                      Icon(Icons.keyboard_arrow_down_outlined),
                                  value: widget.controller.selectedStatus,
                                  isDense: true,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      widget.controller.selectedStatus =
                                          newValue!;
                                    });
                                  },
                                  items: widget.controller.status.map(
                                    (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                                child: Text(
                                  'Pesquisar',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          body: Stack(
            children: [
              GridView.count(
                controller: _scrollController,
                physics: isLoading
                    ? NeverScrollableScrollPhysics()
                    : AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.all(10),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: widget.controller.listCharacterModel
                    .map(
                      (e) => HomeCharacterCardWidget(
                        character: e,
                      ),
                    )
                    .toList(),
              ),
              Visibility(
                visible: widget.controller.listCharacterModel.isEmpty,
                child: Center(
                  child: Text('Falha ao encontrar dados'),
                ),
              ),
              Visibility(
                visible: isLoading,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 18.0),
                    child: CircularProgressIndicator(),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  _scrollListener() async {
    if (_scrollController!.offset >=
            _scrollController!.position.maxScrollExtent &&
        !_scrollController!.position.outOfRange) {
      if (widget.controller.nextPageUrl.isNotEmpty) {
        setState(() {
          isLoading = true;
        });
        await widget.controller.getCharactersByUrl();
      }
      setState(() {
        isLoading = false;
      });
    }
  }
}
