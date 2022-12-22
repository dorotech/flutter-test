import 'package:dorotech_test/app/modules/splash_screen/splash_screen_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreenModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SplashScreenPage()),
  ];
}
