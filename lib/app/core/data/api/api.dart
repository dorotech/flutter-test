class Api {
  static const mainURL = "https://rickandmortyapi.com/api";

  static String getCharacters() {
    return '$mainURL/character/';
  }

  static String getCharactersFilter(
      {required String status, required String gender, String? name}) {
    return '$mainURL/character/?name=$name&status=$status&gender=$gender';
  }
}
