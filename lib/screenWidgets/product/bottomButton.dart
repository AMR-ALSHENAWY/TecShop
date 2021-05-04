import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final Color btnColor;
  final String text;
  final IconData icon;
  final double fontSize;
  final double iconSize;
  final double padding;

  BottomButton({
    Key key,
    this.onTap,
    this.btnColor,
    this.text,
    this.icon,
    this.fontSize,
    this.padding,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      focusColor: Colors.white,
      autofocus: true,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.white), color: btnColor),
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: 2,
                child: Icon(
                  icon,
                  size: iconSize,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 5),
              Flexible(
                flex: 8,
                child: FittedBox(
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.white, fontSize: fontSize, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
