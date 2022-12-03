import 'package:flutter_modular/flutter_modular.dart';

class AppRouters {
  static goToCharacters() async {
    return Modular.to.pushNamed('/');
  }

  AppRouters._();
}
