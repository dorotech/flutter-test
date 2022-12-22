import 'dart:convert';

import 'package:hive/hive.dart';

import '../data.dart';

part 'character.g.dart';

Character characterFromJson(String str) => Character.fromJson(json.decode(str));

String characterToJson(Character data) => json.encode(data.toJson());

@HiveType(typeId: 1)
class Character {
  Character({
    required this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  @HiveField(0)
  int id;
  @HiveField(1)
  DateTime? created;
  @HiveField(2)
  String? name;
  @HiveField(3)
  Status? status;
  @HiveField(4)
  Species? species;
  @HiveField(5)
  String? type;
  @HiveField(6)
  Gender? gender;
  @HiveField(7)
  Location? origin;
  @HiveField(8)
  Location? location;
  @HiveField(9)
  String? image;
  @HiveField(10)
  List<String>? episode;
  @HiveField(11)
  String? url;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"],
        status: json["status"] == null ? null : statusValues.map[json["status"]],
        species: json["species"] == null ? null : speciesValues.map[json["species"]],
        type: json["type"],
        gender: json["gender"] == null ? null : genderValues.map[json["gender"]],
        origin: json["origin"] == null ? null : Location.fromJson(json["origin"]),
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
        image: json["image"],
        episode: json["episode"] == null ? null : List<String>.from(json["episode"].map((x) => x)),
        url: json["url"],
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status == null ? null : statusValues.reverse?[status],
        "species": species == null ? null : speciesValues.reverse?[species],
        "type": type,
        "gender": gender == null ? null : genderValues.reverse?[gender],
        "origin": origin == null ? null : origin!.toJson(),
        "location": location == null ? null : location!.toJson(),
        "image": image,
        "episode": episode == null ? null : List<dynamic>.from(episode!.map((x) => x)),
        "url": url,
        "created": created == null ? null : created!.toIso8601String(),
      };
}

@HiveType(typeId: 3)
class ListCharacterLovers {
  ListCharacterLovers({this.listCharacter});

  @HiveField(0)
  List<Character>? listCharacter;
}
