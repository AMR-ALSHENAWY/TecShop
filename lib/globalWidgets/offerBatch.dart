import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OfferBatch extends StatelessWidget {
  final String text;

  OfferBatch({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(color: Colors.red[700], borderRadius: BorderRadius.circular(7)),
        child: Text(
          text,
          style: Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 15, color: Colors.white),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
