import 'package:dorotechtest/models/personagem.dart';
import 'package:dorotechtest/services/webservice.dart';
import 'package:dorotechtest/view%20models/personagem_view_model.dart';
import 'package:flutter/cupertino.dart';

class PersongemListViewModel extends ChangeNotifier {
  List<PersonagemViewModel> personagens = <PersonagemViewModel>[];

  Future<void> fetchPersonagens(String item) async {
    final results = await Webservice().fetchMovies(item);
    personagens =
        results!.map((item) => PersonagemViewModel(personagem: item)).toList();
    print(personagens);
    notifyListeners();
  }
}
