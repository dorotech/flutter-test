import 'package:dorotech_test/app/common/models/character_model.dart';
import 'package:dorotech_test/app/common/repositories/rickandmorty_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final RickAndMortyRepository repository;
  HomeControllerBase(this.repository);

  @observable
  List<CharacterModel> listCharacterModel = [];

  @action
  Future<List<CharacterModel>> getCharacters() async {
    final result = await repository.getAllCharacters();

    final list = result['results'] as List<dynamic>;

    listCharacterModel = list.map((e) => CharacterModel.fromJson(e)).toList();

    return listCharacterModel;
  }
}
