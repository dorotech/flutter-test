enum Gender { male, female, unknow, genderless }

final genderValues = EnumValues({
  "Female": Gender.female,
  "Male": Gender.male,
  "unknown": Gender.unknow,
  "genderless": Gender.genderless,
});

enum Species { human, alien }

final speciesValues = EnumValues({
  "Alien": Species.alien,
  "Human": Species.human,
});

enum Status { alive, unknow, dead }

final statusValues = EnumValues({
  "Alive": Status.alive,
  "Dead": Status.dead,
  "unknown": Status.unknow,
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
