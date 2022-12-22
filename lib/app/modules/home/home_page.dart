import 'package:dorotech_test/app/common/models/character_model.dart';
import 'package:dorotech_test/app/modules/home/home_controller.dart';
import 'package:dorotech_test/app/modules/home/widgets/home_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Modular.get();

    return FutureBuilder<List<CharacterModel>>(
      future: controller.getCharacters(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: Colors.white,
            child: Center(child: Image.asset('assets/images/portal.gif')),
          );
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomeCard(controller: controller);
        }

        if (snapshot.hasError) {
          return Center(
            child: Text("Falha ao carregar dados"),
          );
        }

        return Container();
      },
    );
  }
}
