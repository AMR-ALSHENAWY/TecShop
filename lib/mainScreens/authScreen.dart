import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tecshop_git/screenWidgets/authScreen/authForm.dart';
import 'package:tecshop_git/screenWidgets/authScreen/components/logoCard.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/authScreen';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: screenSize.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  LogoCard(),
                  SizedBox(height: 30),
                  AuthForm(),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
