import 'dart:convert';

class OriginDto {
  String name;
  String url;
  OriginDto({
    required this.name,
    required this.url,
  });

  OriginDto copyWith({
    String? name,
    String? url,
  }) {
    return OriginDto(
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

  factory OriginDto.fromMap(Map<String, dynamic> map) {
    return OriginDto(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OriginDto.fromJson(String source) =>
      OriginDto.fromMap(json.decode(source));

  @override
  String toString() => 'OriginDto(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OriginDto && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
