// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dorotechtest/pages/personagem_list_page.dart';
import 'package:dorotechtest/view%20models/personagem_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dorotechtest/main.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('wait for an item on the screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(App());
  });

  //Chamando a função responsável por teste de Widget
  testWidgets("Testando tela", (WidgetTester tester) async {
    tester.pumpWidget(MaterialApp(
        home: ChangeNotifierProvider(
      create: (context) => PersongemListViewModel(),
      child: PersonagemListPage(),
    )));
  });
}
