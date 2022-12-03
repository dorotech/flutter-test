import 'package:flutter_modular/flutter_modular.dart';
import 'package:rickandmorty/app/data/datasources/get_character/get_character_datasource.dart';
import 'package:rickandmorty/app/domain/models/dtos/character/character_dto.dart';
import 'package:rickandmorty/core/services/services.dart';

final $GetCharacterImpDatasource = BindInject(
  (i) => GetCharacterImpDatasource(i()),
  isSingleton: true,
  isLazy: true,
);

class GetCharacterImpDatasource implements GetCharacterDatasource {
  final ClientHttps _clientHttps;

  GetCharacterImpDatasource(ClientHttps clientHttps)
      : _clientHttps = clientHttps;

  final _endpoint = '/character';

  @override
  Future<List<CharacterDto>?> call() async {
    final result = await _clientHttps.get(_endpoint);

    result.data = result.data['results'];
    return (result.data as List)
        .map((character) => CharacterDto.fromMap(character))
        .toList();
  }
}
