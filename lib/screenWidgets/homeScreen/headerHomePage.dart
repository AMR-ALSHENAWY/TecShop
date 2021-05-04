import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tecshop_git/globalWidgets/cartBadge.dart';

class HeaderHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 4, 0, 0),
              child: SvgPicture.asset('assets/icons/tecshop.svg', height: 33),
            ),
          ),
          Flexible(
            child: CartBadge(),
          ),
        ],
      ),
    );
  }
}
