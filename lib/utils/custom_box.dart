import 'package:flutter/material.dart';
import 'package:lie_detector/utils/choices.dart';

class CustomBox extends StatelessWidget {
  const CustomBox({
    super.key,
    required this.color,
    required this.text,
  });

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color),
      child: Center(child: Text(text, style: Theme.of(context).textTheme.bodyLarge)),
    );
  }
}
