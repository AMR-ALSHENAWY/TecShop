import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContactIcon extends StatelessWidget {
  final Function onPress;
  final String svgPath;
  final double iconSize;

  const ContactIcon({Key key, this.onPress, this.svgPath, this.iconSize = 50}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Container(
            margin: EdgeInsets.all(4),
            child: SvgPicture.asset(
              svgPath,
              width: iconSize,
            ),
          ),
          onTap: onPress,
        ),
      ),
    );
  }
}
