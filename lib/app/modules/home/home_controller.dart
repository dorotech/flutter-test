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

  var selectedGender = 'Male';

  var selectedStatus = 'Alive';

  @observable
  bool searchBar = false;

  List<String> genders = [
    "Male",
    "Female",
    "Genderless",
    "unknown",
  ];

  List<String> status = [
    "Alive",
    "Dead",
    "unknown",
  ];

  @observable
  String nextPageUrl = '';

  @action
  changeSearchBar() => searchBar = !searchBar;

  @action
  Future<List<CharacterModel>> getCharacters() async {
    final result = await repository.getAllCharacters();

    final list = result['results'] as List<dynamic>;

    listCharacterModel = list.map((e) => CharacterModel.fromJson(e)).toList();

    nextPageUrl = result['info']['next'];

    return listCharacterModel;
  }

  @action
  Future<List<CharacterModel>> getCharactersByUrl() async {
    final result = await repository.getCharacterByURL(url: nextPageUrl);

    final list = result['results'] as List<dynamic>;

    for (int i = 0; i < list.length; i++) {
      listCharacterModel.add(CharacterModel.fromJson(list[i]));
    }

    if (result['info']['next'] != null) {
      nextPageUrl = result['info']['next'];
    } else {
      nextPageUrl = '';
    }

    return listCharacterModel;
  }

  @action
  Future<List<CharacterModel>> filterCharacter(
      {String? name, required String status, required String gender}) async {
    final result = await repository.getCharacterFilter(
        name: name, status: status, gender: gender);

    listCharacterModel = [CharacterModel.fromJson(result)];

    return listCharacterModel;
  }
}
