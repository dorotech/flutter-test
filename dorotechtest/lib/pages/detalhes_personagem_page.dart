import 'package:dorotechtest/models/personagem.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final PersonagemModel user;
  DetailPage(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(user.name!),
        ),
        body: userDetails());
  }

  userDetails() {
    return Container(
      padding: new EdgeInsets.all(32.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(user.image!)),
                borderRadius: BorderRadius.circular(6)),
            width: 120,
            height: 100,
          ),
          ListTile(
            title:
                Text(user.name!, style: TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text(user.status!),
            leading: Icon(Icons.person, color: Colors.blue),
            trailing: Text(user.species!),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.male, color: Colors.blue),
              ),
              Text(user.gender!)
            ],
          ),
        ],
      ),
    );
  }
}
