import 'package:flutter/material.dart';

class GoToLabelArrow extends StatelessWidget {
  final String text;
  final double iconSize;
  final Function onPress;

  const GoToLabelArrow({Key key, this.text, this.iconSize = 15, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      child: Container(
        height: 20,
        margin: EdgeInsets.all(5),
        child: FlatButton.icon(
          padding: EdgeInsets.all(0),
          icon: Text(
            text,
            style: Theme.of(context).textTheme.headline1.copyWith(color: Colors.grey, fontSize: 15),
          ),
          label: Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.22),
              shape: BoxShape.circle
            ),
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              size: iconSize,
            ),
          ),
        ),
      ),
      onTap: onPress,
    );
  }
}
