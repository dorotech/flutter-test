import 'dart:convert';

import 'package:dorotechtest/models/personagem.dart';
import 'package:http/http.dart' as http;

class Webservice {
  Future<List<Personagem>> fetchMovies(String keyword) async {
    final url = "http://www.omdbapi.com/?s=$keyword&apikey=YOURAPIKEY";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["Search"];
      return json.map((movie) => Personagem.fromJson(movie)).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
