import 'package:dorotech_test/app/common/repositories/rickandmorty_repository.dart';
import 'package:dorotech_test/app/core/data/http/http.dart';
import 'package:dorotech_test/app/modules/details/detail_module.dart';
import 'package:dorotech_test/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';
import 'modules/splash_screen/splash_screen_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => HomeController(
        RickAndMortyRepositoryImp(
          HttpClientImp(),
        ),
      ),
    )
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: SplashScreenModule()),
    ModuleRoute('/home/', module: HomeModule()),
    ModuleRoute('/detail/', module: DetailModule()),
  ];
}
