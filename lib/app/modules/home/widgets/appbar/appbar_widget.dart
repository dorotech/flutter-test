import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../home_controller.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Modular.get();
    return PreferredSize(
      preferredSize: Size.fromHeight(56.0),
      child: AppBar(
        title: Text('Personagens'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt_outlined),
            onPressed: () {
              homeController.changeSearchBar();
            },
          )
        ],
      ),
    );
  }
}
