import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

class EmptyMessage extends StatelessWidget {
  final String message;
  final double height;
  final double imgSize;
  final Color fontColor;

  const EmptyMessage({
    Key key,
    this.message = 'Empty',
    this.height = 150,
    this.imgSize = 55,
    this.fontColor = Colors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/empty.svg',
            width: imgSize,
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: fontColor),
            ),
            child: Text(
              message,
              style: Theme.of(context).textTheme.subtitle1.copyWith(color: fontColor, fontSize: 25),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
