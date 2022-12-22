import 'package:dorotechtest/models/personagem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PersonagemDetalhesPage extends StatefulWidget {
  PersonagemModel personagem;

  PersonagemDetalhesPage({Key? key, required this.personagem})
      : super(key: key);

  @override
  _PersonagemDetalhesPageState createState() => _PersonagemDetalhesPageState();
}

class _PersonagemDetalhesPageState extends State<PersonagemDetalhesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.personagem.name!),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Image.network(widget.personagem.image!),
                    width: 50,
                  ),
                  Container(width: 10),
                  Text(
                    widget.personagem.status!,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -1,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
