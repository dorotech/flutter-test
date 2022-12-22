import '../../core/data/api/api.dart';
import '../../core/data/http/http.dart';

abstract class RickAndMortyRepository {
  Future<dynamic> getAllCharacters();
  Future<dynamic> getCharacterByURL({required String url});
  Future<dynamic> getCharacterFilter(
      {required String gender, required String status, String? name});
}

class RickAndMortyRepositoryImp implements RickAndMortyRepository {
  final HttpClient httpClient;
  RickAndMortyRepositoryImp(this.httpClient);

  @override
  Future<dynamic> getAllCharacters() async {
    try {
      final httpResponse = await httpClient.request(
        Api.getCharacters(),
        method: 'get',
      );

      return httpResponse;
    } catch (e) {
      return "Falha ao buscar dados dos personagens.";
    }
  }

  @override
  Future<dynamic> getCharacterByURL({required String url}) async {
    try {
      if (url.isNotEmpty) {
        final httpResponse = await httpClient.request(
          url,
          method: 'get',
        );
        return httpResponse;
      }
    } catch (e) {
      return "Falha ao buscar dados.";
    }
  }

  @override
  Future<dynamic> getCharacterFilter(
      {required String status, required String gender, String? name}) async {
    try {
      final httpResponse = await httpClient.request(
        Api.getCharactersFilter(status: status, gender: gender, name: name),
        method: 'get',
      );

      return httpResponse;
    } catch (e) {
      return "Falha ao buscar dados.";
    }
  }
}
