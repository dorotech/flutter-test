class Api {
  static const mainURL = "https://rickandmortyapi.com/api";

  static String getCharacters(int? pageNumber) {
    return '$mainURL/character/?page=$pageNumber';
  }
}
