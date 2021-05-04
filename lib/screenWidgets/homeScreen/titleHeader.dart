import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {
  final String text;
  final Color color;
  final Color borderColor;
  final Color textColor;
  final double margin;
  final double fontSize;

  TitleHeader({
    Key key,
    this.text,
    this.color,
    this.borderColor = Colors.transparent,
    this.textColor = Colors.black,
    this.margin = 10,
    this.fontSize = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(200), border: Border.all(color: borderColor)),
        padding: EdgeInsets.only(right: 12, left: 12, top: 4, bottom: 4),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline1.copyWith(fontSize: fontSize, fontWeight: FontWeight.w700, color: textColor),
        ),
      ),
    );
  }
}
