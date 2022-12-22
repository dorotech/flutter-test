import 'dart:convert';

import 'data.dart';

ListCharacter listCharacterFromJson(String str) => ListCharacter.fromJson(json.decode(str));

String listCharacterToJson(ListCharacter data) => json.encode(data.toJson());

class ListCharacter {
  ListCharacter({
    this.info,
    this.results,
  });

  Info? info;
  List<Character>? results;

  factory ListCharacter.fromJson(Map<String, dynamic> json) => ListCharacter(
        info: json["info"] == null ? null : Info.fromJson(json["info"]),
        results:
            json["results"] == null ? null : List<Character>.from(json["results"].map((x) => Character.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info == null ? null : info!.toJson(),
        "results": results == null ? null : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}
