// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CharacterAdapter extends TypeAdapter<Character> {
  @override
  final int typeId = 1;

  @override
  Character read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Character(
      id: fields[0] as int,
      name: fields[2] as String?,
      status: fields[3] as Status?,
      species: fields[4] as Species?,
      type: fields[5] as String?,
      gender: fields[6] as Gender?,
      origin: fields[7] as Location?,
      location: fields[8] as Location?,
      image: fields[9] as String?,
      episode: (fields[10] as List?)?.cast<String>(),
      url: fields[11] as String?,
      created: fields[1] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Character obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.created)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.species)
      ..writeByte(5)
      ..write(obj.type)
      ..writeByte(6)
      ..write(obj.gender)
      ..writeByte(7)
      ..write(obj.origin)
      ..writeByte(8)
      ..write(obj.location)
      ..writeByte(9)
      ..write(obj.image)
      ..writeByte(10)
      ..write(obj.episode)
      ..writeByte(11)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharacterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CharacterFavoriteAdapter extends TypeAdapter<CharacterFavorite> {
  @override
  final int typeId = 3;

  @override
  CharacterFavorite read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CharacterFavorite(
      listCharacter: (fields[0] as List?)?.cast<Character>(),
    );
  }

  @override
  void write(BinaryWriter writer, CharacterFavorite obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.listCharacter);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharacterFavoriteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
