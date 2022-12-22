import 'package:flutter/cupertino.dart';

class TextTitle extends StatelessWidget {
  const TextTitle(this.text, {super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        fontFamily: "Regular",
      ),
      textAlign: TextAlign.start,
    );
  }
}
