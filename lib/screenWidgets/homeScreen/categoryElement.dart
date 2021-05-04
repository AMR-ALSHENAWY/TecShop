import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tecshop_git/themes/light_color.dart';

class CategoryElement extends StatelessWidget {
  final Function onPress;
  final String imgUrl;
  final String itemName;
  final double width;

  const CategoryElement({
    Key key,
    this.imgUrl,
    this.onPress,
    this.width,
    this.itemName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        onTap: onPress,
        child: Card(
          elevation: 0.5,
          margin: EdgeInsets.all(5),
          shadowColor: LightColors.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
            alignment: Alignment.center,
            height: 80,
            width: width,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
            margin: EdgeInsets.all(7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /**Icon
                 *
                 */
                Expanded(
                  flex: 2,
                  child: SvgPicture.network(
                    imgUrl,
                    height: 45,
                  ),
                ),
                /**title
                 *
                 */
                Flexible(
                  flex: 6,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      itemName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline1.copyWith(fontWeight: FontWeight.w300, fontSize: 19),
                    ),
                  ),
                ),
                /**Arrow
                 *
                 */
                Flexible(
                  flex: 2,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: LightColors.primaryColor.withOpacity(0.05),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: LightColors.primaryColor,
                      size: 22,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
