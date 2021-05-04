import 'package:flutter/material.dart';

class HeaderWithLead extends StatelessWidget {
  final Color headerColor;
  final String headerTitle;
  final Widget leadingIcon;

  const HeaderWithLead({Key key, this.headerColor, this.headerTitle, this.leadingIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.bottomLeft,
      height: 110,
      color: headerColor,
      child: FittedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: leadingIcon,
              ),
            ),
            Text(
              headerTitle,
              textAlign: TextAlign.left,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 30, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
