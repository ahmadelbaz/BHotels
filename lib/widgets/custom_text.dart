import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final int maxLine;
  final double height;

  const CustomText(this.text, this.fontSize,
      {this.color = Colors.black,
      this.alignment = Alignment.center,
      this.maxLine = 100,
      this.height = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize, color: color, height: height),
        maxLines: maxLine,
      ),
    );
  }
}
