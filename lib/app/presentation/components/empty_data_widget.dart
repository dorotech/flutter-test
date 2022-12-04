import 'package:flutter/material.dart';

class EmptyData extends StatelessWidget {
  final String? title;
  final String? message;

  const EmptyData({
    Key? key,
    this.message,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.warning_amber_rounded,
            size: 65,
            color: Color.fromARGB(255, 255, 147, 64),
          ),
          if (title != null) const SizedBox(height: 10),
          if (title != null)
            Text(
              title!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 255, 147, 64),
                fontSize: 18,
              ),
            ),
          const SizedBox(height: 10),
          Text(
            message ?? "Não foram encontrados dados para sua solicitação.",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
