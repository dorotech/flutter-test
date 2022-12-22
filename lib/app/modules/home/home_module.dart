import 'package:dorotech_test/app/common/repositories/rickandmorty_repository.dart';
import 'package:dorotech_test/app/core/data/http/http.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => HomeController(
        RickAndMortyRepositoryImp(
          HttpClientImp(),
        ),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}
