class CharacterModel {
  int? id;
  String? name;
  String? status;
  String? type;
  String? gender;
  String? species;
  Map<String, dynamic>? origin;
  Map<String, dynamic>? location;
  String? image;

  CharacterModel({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json["id"],
      name: json["name"],
      status: json["status"],
      species: json["species"],
      type: json["type"],
      gender: json["gender"],
      origin: json["origin"],
      location: json["location"],
      image: json["image"],
    );
  }
}
