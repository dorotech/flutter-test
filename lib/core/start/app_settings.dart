import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppSettings {
  static Future<void> init({
    String initialRoute = '/',
    required Module module,
  }) async {
    WidgetsFlutterBinding.ensureInitialized();
    Modular.init(module);
    await _initRoute(initialRoute);
  }

  static Future<void> _initRoute(String initialRoute) async {
    Modular.setInitialRoute(initialRoute);
  }
}
