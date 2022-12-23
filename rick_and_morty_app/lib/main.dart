import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_and_morty_app/core/core.dart';
import 'features/list_characters/presenter/presenter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!kIsWeb) {
    Directory appDocumentDir = await getApplicationDocumentsDirectory();
    Hive
      ..init(appDocumentDir.path)
      ..registerAdapter(CharacterAdapter())
      ..registerAdapter(LocationAdapter())
      ..registerAdapter(CharacterFavoriteAdapter())
      ..registerAdapter(StatusAdapter())
      ..registerAdapter(SpeciesAdapter())
      ..registerAdapter(GenderAdapter());
  } else {
    Hive.registerAdapter(CharacterAdapter());
    Hive.registerAdapter(LocationAdapter());
    Hive.registerAdapter(CharacterFavoriteAdapter());
    Hive.registerAdapter(StatusAdapter());
    Hive.registerAdapter(SpeciesAdapter());
    Hive.registerAdapter(GenderAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty',
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const ListCharactersPresenter(),
    );
  }
}
