// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enums.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GenderAdapter extends TypeAdapter<Gender> {
  @override
  final int typeId = 6;

  @override
  Gender read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Gender.male;
      case 1:
        return Gender.female;
      case 2:
        return Gender.unknow;
      case 3:
        return Gender.genderless;
      default:
        return Gender.male;
    }
  }

  @override
  void write(BinaryWriter writer, Gender obj) {
    switch (obj) {
      case Gender.male:
        writer.writeByte(0);
        break;
      case Gender.female:
        writer.writeByte(1);
        break;
      case Gender.unknow:
        writer.writeByte(2);
        break;
      case Gender.genderless:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SpeciesAdapter extends TypeAdapter<Species> {
  @override
  final int typeId = 5;

  @override
  Species read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Species.human;
      case 1:
        return Species.alien;
      default:
        return Species.human;
    }
  }

  @override
  void write(BinaryWriter writer, Species obj) {
    switch (obj) {
      case Species.human:
        writer.writeByte(0);
        break;
      case Species.alien:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpeciesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StatusAdapter extends TypeAdapter<Status> {
  @override
  final int typeId = 4;

  @override
  Status read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Status.alive;
      case 1:
        return Status.unknow;
      case 2:
        return Status.dead;
      default:
        return Status.alive;
    }
  }

  @override
  void write(BinaryWriter writer, Status obj) {
    switch (obj) {
      case Status.alive:
        writer.writeByte(0);
        break;
      case Status.unknow:
        writer.writeByte(1);
        break;
      case Status.dead:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
