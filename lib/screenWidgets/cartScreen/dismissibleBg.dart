import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DismissibleBg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: FlatButton(
          child: SvgPicture.asset(
            "assets/icons/x.svg",
            height: 40,
            alignment: Alignment.centerRight,
          ),
        ),
        alignment: Alignment.centerRight,
        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.red[600]),
      ),
    );
  }
}
