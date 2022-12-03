import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'location_dto.dart';
import 'origin_dto.dart';

class CharacterDto {
  int id;
  String name;
  String status;
  String type;
  String gender;
  OriginDto origin;
  LocationDto location;
  String image;
  List<String> episode;
  String url;
  String created;
  CharacterDto({
    required this.id,
    required this.name,
    required this.status,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  CharacterDto copyWith({
    int? id,
    String? name,
    String? status,
    String? type,
    String? gender,
    OriginDto? origin,
    LocationDto? location,
    String? image,
    List<String>? episode,
    String? url,
    String? created,
  }) {
    return CharacterDto(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      type: type ?? this.type,
      gender: gender ?? this.gender,
      origin: origin ?? this.origin,
      location: location ?? this.location,
      image: image ?? this.image,
      episode: episode ?? this.episode,
      url: url ?? this.url,
      created: created ?? this.created,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'status': status});
    result.addAll({'type': type});
    result.addAll({'gender': gender});
    result.addAll({'origin': origin.toMap()});
    result.addAll({'location': location.toMap()});
    result.addAll({'image': image});
    result.addAll({'episode': episode});
    result.addAll({'url': url});
    result.addAll({'created': created});

    return result;
  }

  factory CharacterDto.fromMap(Map<String, dynamic> map) {
    return CharacterDto(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      status: map['status'] ?? '',
      type: map['type'] ?? '',
      gender: map['gender'] ?? '',
      origin: OriginDto.fromMap(map['origin']),
      location: LocationDto.fromMap(map['location']),
      image: map['image'] ?? '',
      episode: List<String>.from(map['episode']),
      url: map['url'] ?? '',
      created: map['created'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterDto.fromJson(String source) =>
      CharacterDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CharacterDto(id: $id, name: $name, status: $status, type: $type, gender: $gender, origin: $origin, location: $location, image: $image, episode: $episode, url: $url, created: $created)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CharacterDto &&
        other.id == id &&
        other.name == name &&
        other.status == status &&
        other.type == type &&
        other.gender == gender &&
        other.origin == origin &&
        other.location == location &&
        other.image == image &&
        listEquals(other.episode, episode) &&
        other.url == url &&
        other.created == created;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        status.hashCode ^
        type.hashCode ^
        gender.hashCode ^
        origin.hashCode ^
        location.hashCode ^
        image.hashCode ^
        episode.hashCode ^
        url.hashCode ^
        created.hashCode;
  }
}
