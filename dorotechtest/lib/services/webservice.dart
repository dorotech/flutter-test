import 'dart:convert';

import 'package:dorotechtest/models/personagem.dart';
import 'package:http/http.dart' as http;

class Webservice {
  Future<List<PersonagemModel>> fetchMovies() async {
    String url = "https://rickandmortyapi.com/api/character/?page=19";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body['results'];
      print(json);
      return json
          .map((personagem) => PersonagemModel.fromJson(personagem))
          .toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
