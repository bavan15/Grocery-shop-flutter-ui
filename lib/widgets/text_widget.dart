import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  TextWidget({
    required this.title,
    required this.textSize,
    required this.color,
    this.isTitle = false,
    this.maxLines = 10,
    Key? key,
  }) : super(key: key);

  final String title;
  final double textSize;
  final Color color;
  bool isTitle;
  int maxLines;


  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: textSize,
        color: color,
        overflow: TextOverflow.ellipsis,
        fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
