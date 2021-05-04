import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class GeneralFunctions {
  static void showToast(String message, Color color, {bool long = false, double fontSize = 15}) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: color,
      textColor: Colors.white,
      toastLength: long ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
      fontSize: fontSize,
    );

  }

  //-----------------------------------------------------
  static void openUrl(String url) async {
    try {
      bool launched = await launch(url, forceSafariVC: false, forceWebView: false);
      if (!launched) {
        await launch(url, forceSafariVC: false, forceWebView: false);
      }
    } catch (e) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    }
  }

  //-----------------------------------------------------
  static bool isValidEmail(String value) {
    return RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(value);
  }
}
