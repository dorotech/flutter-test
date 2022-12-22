import 'package:dorotechtest/models/personagem.dart';
import 'package:dorotechtest/pages/detalhes_personagem_page.dart';
import 'package:dorotechtest/view%20models/personagem_list_model.dart';
import 'package:dorotechtest/widgets/personagem_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonagemListPage extends StatefulWidget {
  @override
  _PersonagemListPageState createState() => _PersonagemListPageState();
}

class _PersonagemListPageState extends State<PersonagemListPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadingWidget();
    // you can uncomment this to get all batman movies when the page is loaded
    Provider.of<PersongemListViewModel>(context, listen: false)
        .fetchPersonagens('');
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final personagemListViewModel =
        Provider.of<PersongemListViewModel>(context);

    void openScreen() {
      Navigator.pushReplacementNamed(context, 'second',
          arguments: {"name": _controller.value.text});
    }

    return Scaffold(
        appBar: AppBar(title: Text("Personagens")),
        body: Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _controller,
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      personagemListViewModel.fetchPersonagens(value);
                      _controller.clear();
                    }
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none),
                ),
              ),
              Expanded(
                  child: PersonagemList(
                      personagem: personagemListViewModel.personagens))
            ])));
  }
}
