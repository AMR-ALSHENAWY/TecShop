import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CheckItemWidget extends StatelessWidget {
  final bool isChecked;
  final bool showCheckBox;
  final String text;
  final String svgPath;
  final Function onPress;

  const CheckItemWidget({
    Key key,
    this.showCheckBox = true,
    this.isChecked = false,
    this.text,
    this.svgPath,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10)), border: isChecked ? Border.all(color: Colors.blue, width: 1.5) : Border.all(color: Colors.grey[200], width: 1)),
        margin: EdgeInsets.all(5),
        child: ListTile(
          trailing: Container(
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
            child: isChecked
                ? Icon(
                    Icons.check_circle,
                    size: 30.0,
                    color: Colors.white,
                  )
                : showCheckBox
                    ? Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(50), border: Border.all(color: Colors.grey.withOpacity(0.8))),
                      )
                    : Container(height: 0, width: 0),
          ),
          leading: SvgPicture.asset(
            svgPath,
            height: 40,
          ),
          title: Text(
            text,
            style: Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
