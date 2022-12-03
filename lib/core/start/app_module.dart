import 'package:flutter_modular/flutter_modular.dart';
import 'package:rickandmorty/app/data/repositories/get_character/get_character_imp_repository.dart';
import 'package:rickandmorty/app/data/repositories/get_character_by_id/get_character_by_id_imp_repository.dart';
import 'package:rickandmorty/app/domain/usecases/get_character/get_character_imp_usecase.dart';
import 'package:rickandmorty/app/domain/usecases/get_character_by_id/get_character_by_id_imp_usecase.dart';
import 'package:rickandmorty/app/external/datasources/get_character/get_character_imp_datasource.dart';
import 'package:rickandmorty/app/presentation/pages/character/character_controller.dart';
import 'package:rickandmorty/app/presentation/pages/character/character_page.dart';
import 'package:rickandmorty/app/presentation/pages/character_details/character_details_controller.dart';
import 'package:rickandmorty/app/presentation/pages/character_details/character_details_page.dart';
import 'package:rickandmorty/core/services/client_http/client_http.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        // usecases
        $GetCharacterImpUsecase,
        $GetCharacterByIdImpUsecase,

        // repositories
        $GetCharacterImpRepository,
        $GetCharacterByIdImpRepository,

        // datasources
        $GetCharacterImpDatasource,
        $GetCharacterImpDatasource,

        // controllers
        $ClientHttps,
        $CharacterController,
        $CharacterDetailsController
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (ctx, args) => const CharacterPage()),
        ChildRoute(
          '/character/details',
          child: (ctx, args) => CharacterDetailsPage(
            character: args.data['character'],
          ),
        ),
      ];
}
