import 'package:flutter_modular/flutter_modular.dart';
import 'package:rickandmorty/app/data/datasources/get_character_by_id/get_character_by_id_datasource.dart';
import 'package:rickandmorty/app/domain/models/dtos/character/character_dto.dart';
import 'package:rickandmorty/core/services/services.dart';

final $GetCharacterByIdImpDatasource = BindInject(
  (i) => GetCharacterByIdImpDatasource(i()),
  isSingleton: true,
  isLazy: true,
);

class GetCharacterByIdImpDatasource implements GetCharacterByIdDatasource {
  final ClientHttps _clientHttps;

  GetCharacterByIdImpDatasource(ClientHttps clientHttps)
      : _clientHttps = clientHttps;

  @override
  Future<CharacterDto> call(int id) async {
    String endpoint = '/character/$id';
    final result = await _clientHttps.get(endpoint);

    return CharacterDto.fromMap(result.data);
  }
}
