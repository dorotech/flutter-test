import 'dart:convert';

import 'package:dorotechtest/models/personagem.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Webservice with ChangeNotifier {
  int? _page;

  final List<PersonagemModel> _personagemService = [];

  List<PersonagemModel> get personagemService => _personagemService;

  Future<List<PersonagemModel>?> fetchMovies(_page) async {
    String url = "https://rickandmortyapi.com/api/character/?page=$_page";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body['results'];
      final results = jsonDecode(response.body)['info'];
      // print(' resutsssss ${results}');

      for (var i = 0; i < results.length; i++) {
        print('xxxxxxxxxxxxxxx :  ${results}');
        // _personagemService.add(PersonagemModel.fromJson(results[i]));
        // return json
        //     .map((personagem) => PersonagemModel.fromJson(personagem))
        //     .toList();
      }
      // _page++;
      notifyListeners();
      // print(json);
      return json
          .map((personagem) => PersonagemModel.fromJson(personagem))
          .toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
