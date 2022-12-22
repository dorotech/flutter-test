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
            preferredSize: Size.fromHeight(56.0),
            child: AppbarWidget(),
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
}
