import 'package:flutter/cupertino.dart';
import 'package:rickandmorty/core/start/app_module.dart';
import 'package:rickandmorty/core/start/app_root.dart';
import 'package:rickandmorty/core/start/app_settings.dart';

void main() async {
  await AppSettings.init(initialRoute: '/', module: AppModule());
  const app = AppRoot();

  runApp(app);
}
