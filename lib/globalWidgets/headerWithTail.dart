import 'package:flutter/material.dart';

class HeaderWithTail extends StatelessWidget {
  final Color headerColor;
  final String headerTitle;
  final Widget tailingIcon;

  const HeaderWithTail({Key key, this.headerColor, this.headerTitle, this.tailingIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.bottomLeft,
      height: 110,
      color: headerColor,
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 25,
                  color: headerColor,
                ),
              ),
            ),
            FlatButton.icon(
              padding: EdgeInsets.all(0),
              icon: Text(
                headerTitle,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 30, color: Colors.white),
              ),
              label: tailingIcon != null ? tailingIcon : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
