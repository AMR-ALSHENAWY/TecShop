import 'package:flutter/material.dart';
import 'package:tecshop_git/themes/light_color.dart';

class TxtField extends StatelessWidget {
  final String hint;
  final String upperTitle;
  final int maxLine;
  final double fieldHeight;
  final TextInputType textInputType;
  final TextEditingController textEditingController;
  final Function(String) validator;

  const TxtField({
    Key key,
    @required this.hint,
    @required this.upperTitle,
    this.textInputType,
    this.maxLine = 1,
    this.fieldHeight = 55,
    this.validator,
    this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 13,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            upperTitle,
            style: Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 17),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
            height: fieldHeight,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
                controller: textEditingController,
                maxLines: maxLine,
                keyboardType: textInputType,
                cursorColor: LightColors.primaryColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintStyle: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.grey.withOpacity(0.9)),
                  hintText: hint,
                ),
                validator: validator),
          )
        ],
      ),
    );
  }
}
