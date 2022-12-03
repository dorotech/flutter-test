import 'dart:convert';

class LocationDto {
  String name;
  String url;
  LocationDto({
    required this.name,
    required this.url,
  });

  LocationDto copyWith({
    String? name,
    String? url,
  }) {
    return LocationDto(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'url': url});

    return result;
  }

  factory LocationDto.fromMap(Map<String, dynamic> map) {
    return LocationDto(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationDto.fromJson(String source) =>
      LocationDto.fromMap(json.decode(source));

  @override
  String toString() => 'LocationDto(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LocationDto && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
