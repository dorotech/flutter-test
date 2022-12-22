class Personagem {
  final String? title;
  final String? poster;

  Personagem({this.title, this.poster});

  factory Personagem.fromJson(Map<String, dynamic> json) {
    return Personagem(title: json["Title"], poster: json["Poster"]);
  }
}
