import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class LightColors {
  static const Color primaryColor = Color(0xFF3366bb);
  static const Color accentColor = Color(0xFFFFCCaa);
  static const Color lightGreyColor = Color(0xFFedf2f4);
  static const Color blueColor = Color(0xFF1d4298);
  static const Color darkBlueColor = Color(0xFF073b4c);
  static const Color yellowColor = Color(0xFFffb703);
  static const Color pinkColor = Color(0xFFef476f);
  static const Color greenColor = Color(0xff24AF79);
  static const Color mercadoBColor = Color(0xff50c1e9);

  static const kFieldDecoration = InputDecoration(
    fillColor: Colors.white,
    filled: true,
    hintText: 'hint',
    hintStyle: TextStyle(fontSize: 17),
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: lightGreyColor, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: LightColors.primaryColor, width: 1.5),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
  );
}
