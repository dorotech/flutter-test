import 'package:dorotechtest/pages/personagem_list_page.dart';
import 'package:dorotechtest/view%20models/personagem_list_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(backgroundColor: Colors.black),
        debugShowCheckedModeBanner: false,
        title: "rick and morty",
        home: ChangeNotifierProvider(
          create: (context) => PersongemListViewModel(),
          child: PersonagemListPage(),
        ));
  }
}
