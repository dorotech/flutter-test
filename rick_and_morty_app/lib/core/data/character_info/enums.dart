import 'package:hive/hive.dart';
part 'enums.g.dart';

@HiveType(typeId: 6)
enum Gender {
  @HiveField(0)
  male,
  @HiveField(1)
  female,
  @HiveField(2)
  unknow,
  @HiveField(3)
  genderless,
}

final genderValues = EnumValues({
  "Female": Gender.female,
  "Male": Gender.male,
  "unknown": Gender.unknow,
  "genderless": Gender.genderless,
});

@HiveType(typeId: 5)
enum Species {
  @HiveField(0)
  human,
  @HiveField(1)
  alien
}

final speciesValues = EnumValues({
  "Alien": Species.alien,
  "Human": Species.human,
});

@HiveType(typeId: 4)
enum Status {
  @HiveField(0)
  alive,
  @HiveField(1)
  unknow,
  @HiveField(2)
  dead,
}

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
