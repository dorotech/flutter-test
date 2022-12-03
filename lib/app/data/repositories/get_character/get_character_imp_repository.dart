import 'package:flutter_modular/flutter_modular.dart';
import 'package:rickandmorty/app/data/datasources/get_character/get_character_datasource.dart';
import 'package:rickandmorty/app/domain/models/dtos/character/character_dto.dart';
import 'package:rickandmorty/app/domain/models/exceptions/exception.dart';
import 'package:rickandmorty/app/domain/models/exceptions/generic_exception.dart';
import 'package:rickandmorty/app/domain/models/loggers/logger.dart';
import 'package:rickandmorty/app/domain/repositories/get_character/get_character_repository.dart';

final $GetCharacterImpRepository = BindInject(
  (i) => GetCharacterImpRepository(i.get()),
  isSingleton: true,
  isLazy: true,
);

class GetCharacterImpRepository implements GetCharacterRepository {
  final GetCharacterDatasource _getCharacterDatasource;

  GetCharacterImpRepository(this._getCharacterDatasource);

  @override
  Future<List<CharacterDto>?> call(String? query) async {
    try {
      return await _getCharacterDatasource(query);
    } on RMException catch (e) {
      clLog(e);
      rethrow;
    } catch (e) {
      throw GenericException();
    }
  }
}
