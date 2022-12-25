import 'dart:convert';
import 'package:flutter/material.dart';
import '../model/rickandmorty_model.dart';
import 'package:http/http.dart' as http;

abstract class RickandMortyRepository {
  Future<RickandMortyModel> getAll();
}

class RickandMortyRepositoryImplementation implements RickandMortyRepository {
  late final BuildContext context;

  RickandMortyRepositoryImplementation(this.context);
  @override
  Future<RickandMortyModel> getAll() async {
    var client = http.Client();
    String url = "https://rickandmortyapi.com/api/character";

    var response = await client.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      return RickandMortyModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load post');
    }
  }
}
