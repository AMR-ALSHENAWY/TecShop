import 'package:flutter/material.dart';

class TitleHeaderSimple extends StatelessWidget {
  final String text;

  TitleHeaderSimple({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('title header');
    return Container(
      padding: EdgeInsets.all(15),
      alignment: Alignment.centerLeft,
      child: FittedBox(
        child: Text(
          text,
          textAlign: TextAlign.left,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
