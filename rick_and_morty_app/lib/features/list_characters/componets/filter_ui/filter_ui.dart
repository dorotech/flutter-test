import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FilterUi extends StatelessWidget {
  const FilterUi({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(controller: textEditingController),
            Text("Escolha o genero"),
            Text("Escolha o espécie"),
            Text("Escolha o status"),
          ],
        ),
      ),
    );
  }
}
