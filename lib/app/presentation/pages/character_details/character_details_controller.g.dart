// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterDetailsController on _CharacterDetailsControllerBase, Store {
  late final _$loadingAtom =
      Atom(name: '_CharacterDetailsControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$characterIdAtom = Atom(
      name: '_CharacterDetailsControllerBase.characterId', context: context);

  @override
  int? get characterId {
    _$characterIdAtom.reportRead();
    return super.characterId;
  }

  @override
  set characterId(int? value) {
    _$characterIdAtom.reportWrite(value, super.characterId, () {
      super.characterId = value;
    });
  }

  late final _$characterDtoAtom = Atom(
      name: '_CharacterDetailsControllerBase.characterDto', context: context);

  @override
  CharacterDto? get characterDto {
    _$characterDtoAtom.reportRead();
    return super.characterDto;
  }

  @override
  set characterDto(CharacterDto? value) {
    _$characterDtoAtom.reportWrite(value, super.characterDto, () {
      super.characterDto = value;
    });
  }

  @override
  String toString() {
    return '''
loading: ${loading},
characterId: ${characterId},
characterDto: ${characterDto}
    ''';
  }
}
