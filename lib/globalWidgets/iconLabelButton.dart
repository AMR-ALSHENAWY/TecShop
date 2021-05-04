import 'package:flutter/material.dart';

class IconLabelButton extends StatelessWidget {
  final Function onPress;
  final double fontSize;
  final double buttonHeight;
  final double buttonWidth;
  final Widget childIcon;
  final String labelText;
  final Color textColor;

  const IconLabelButton({
    Key key,
    this.onPress,
    this.fontSize = 15,
    this.childIcon,
    this.labelText,
    this.buttonHeight = 40,
    this.buttonWidth,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: onPress,
        child: Container(
          height: buttonHeight,
          width: buttonWidth,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.grey.withOpacity(0.1)),
          child: FlatButton.icon(
            splashColor: Colors.grey.withOpacity(0.2),
            icon: childIcon,
            label: Text(
              labelText,
              style: Theme.of(context).textTheme.headline1.copyWith(color: textColor, fontSize: fontSize, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
