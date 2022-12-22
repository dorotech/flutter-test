import 'package:dorotech_test/app/common/models/character_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppbarDetail extends StatelessWidget {
  final CharacterModel characterModel;
  const AppbarDetail({Key? key, required this.characterModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(characterModel.name!),
      elevation: 0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          Modular.to.navigate('/home/');
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
