import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  final Function onPress;
  final double size;
  final Widget icon;
  final Color fillColor;
  final Color iconColor;
  final Color borderColor;

  CircleIcon({
    Key key,
    this.onPress,
    this.size,
    this.fillColor,
    this.iconColor,
    this.borderColor = Colors.white,
    this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
            color: fillColor,
            shape: BoxShape.circle,
            border: Border.all(width: 1, color: borderColor)),
        child: icon,
      ),
      onTap: onPress,
    );
  }
}
