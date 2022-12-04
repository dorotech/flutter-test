import 'package:flutter_modular/flutter_modular.dart';
import 'package:rickandmorty/app/data/datasources/get_character_by_id/get_character_by_id_datasource.dart';
import 'package:rickandmorty/app/domain/models/dtos/character/character_dto.dart';
import 'package:rickandmorty/app/domain/models/exceptions/exception.dart';
import 'package:rickandmorty/app/domain/models/exceptions/generic_exception.dart';
import 'package:rickandmorty/app/domain/models/loggers/logger.dart';
import 'package:rickandmorty/app/domain/repositories/get_character_by_id/get_character_by_id_repository.dart';

final $GetCharacterByIdImpRepository = BindInject(
  (i) => GetCharacterByIdImpRepository(i.get()),
  isSingleton: true,
  isLazy: true,
);

class GetCharacterByIdImpRepository implements GetCharacterByIdRepository {
  final GetCharacterByIdDatasource _getCharacterByIdDatasource;

  GetCharacterByIdImpRepository(this._getCharacterByIdDatasource);

  @override
  Future<CharacterDto> call(int id) async {
    try {
      return await _getCharacterByIdDatasource(id);
    } on RMException catch (e) {
      clLog(e);
      rethrow;
    } catch (e) {
      throw GenericException();
    }
  }
}
