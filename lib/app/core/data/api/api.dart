class Api {
  static const mainURL = "https://rickandmortyapi.com/api";

  static String getCharacters() {
    return '$mainURL/character/';
  }
}
