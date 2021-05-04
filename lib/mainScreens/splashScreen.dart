import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tecshop_git/screenWidgets/authScreen/components/logoCard.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splashScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LogoCard(),
      ),
    );
  }
}
