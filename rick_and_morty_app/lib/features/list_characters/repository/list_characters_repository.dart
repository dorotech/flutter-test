import 'package:http/http.dart' as http;
import 'package:rick_and_morty_app/core/core.dart';

abstract class IListCharactersRepository {
  Future<String> getListChatactersRepository({
    String? page,
    String? status,
    String? gender,
    String? type,
    String? species,
    String? name,
  });
}

class ListCharactersRepository implements IListCharactersRepository {
  @override
  Future<String> getListChatactersRepository({
    String? page,
    String? status,
    String? gender,
    String? type,
    String? species,
    String? name,
  }) async {
    bool hasInternet = await CheckConnectivity().check();
    if (!hasInternet) throw DefalutStrings.noInternet;

    String url = "https://rickandmortyapi.com/api/character/";
    String params = "";
    if (page != null) {
      params += params.isEmpty ? "?page=$page" : "&page=$page";
    }
    if (status != null) {
      params += params.isEmpty ? "?status=$status" : "&status=$status";
    }
    if (gender != null) {
      params += params.isEmpty ? "?gender=$gender" : "&gender=$gender";
    }
    if (type != null) {
      params += params.isEmpty ? "?type=$type" : "&type=$type";
    }
    if (species != null) {
      params += params.isEmpty ? "?species=$species" : "&species=$species";
    }
    if (name != null) {
      params += params.isEmpty ? "?name=$name" : "&name=$name";
    }
    url += params;

    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw DefalutStrings.unknownError;
    } else {
      return response.body;
    }
  }
}
