import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final String text;
  final String? icon;
  final Color? iconColor;
  final Color textColor;
  final Color background;

  const StatusBadge({
    Key? key,
    required this.text,
    required this.textColor,
    required this.background,
    this.icon,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Image.asset(
                icon!,
                width: 16,
                color: iconColor,
              ),
            const SizedBox(
              width: 3,
            ),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
