import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoToBtnCard extends StatelessWidget {
  final Function onPress;
  final String svgImage;
  final String itemName;
  final double width;

  const GoToBtnCard({
    Key key,
    this.svgImage,
    this.onPress,
    this.width,
    this.itemName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        width: width,
        margin: EdgeInsets.all(7),
        child: ListTile(
          leading: SvgPicture.asset(
            svgImage,
            height: 28,
          ),
          title: Text(
            itemName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle2.copyWith(fontWeight: FontWeight.w400, fontSize: 18),
          ),
          trailing: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.grey.withOpacity(0.12),
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
