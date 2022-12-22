import '../data.dart';
import 'dart:convert';

Character characterFromJson(String str) => Character.fromJson(json.decode(str));

String characterToJson(Character data) => json.encode(data.toJson());

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

  int id;
  String? name;
  Status? status;
  Species? species;
  String? type;
  Gender? gender;
  Location? origin;
  Location? location;
  String? image;
  List<String>? episode;
  String? url;
  DateTime? created;

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
