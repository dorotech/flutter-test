import 'package:hive/hive.dart';
part 'location.g.dart';

@HiveType(typeId: 2)
class Location {
  Location({
    this.name,
    this.url,
  });
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? url;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
