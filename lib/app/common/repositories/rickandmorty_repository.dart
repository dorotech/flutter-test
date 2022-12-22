import '../../core/data/api/api.dart';
import '../../core/data/http/http.dart';

abstract class RickAndMortyRepository {
  Future<dynamic> getAllCharacters();
}

class RickAndMortyRepositoryImp implements RickAndMortyRepository {
  final HttpClient httpClient;
  RickAndMortyRepositoryImp(this.httpClient);

  @override
  Future<dynamic> getAllCharacters() async {
    try {
      final httpResponse = await httpClient.request(
        Api.getCharacters(1),
        method: 'get',
      );

      return httpResponse;
    } catch (e) {
      return "Falha ao buscar dados dos personagens.";
    }
  }
}
