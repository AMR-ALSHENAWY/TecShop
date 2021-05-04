import 'package:flutter/material.dart';
import 'package:tecshop_git/generalFunctions.dart';
import 'contactIcon.dart';

class ContactIconRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const facebookUrl = 'https://www.facebook.com/eng.amr.alshenawy';
    const linkedInUrl = 'https://www.linkedin.com/in/amr-alshenawy';
    const watsApp = 'https://wa.me/+201067316151';
    const mobileNumber = 'tel:+201067316151';
    return Card(
      child: Container(
        margin: EdgeInsets.all(7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ContactIcon(
              svgPath: 'assets/icons/linked.svg',
              onPress: () => GeneralFunctions.openUrl(linkedInUrl),
            ),
            ContactIcon(
              svgPath: 'assets/icons/facebook.svg',
              onPress: () => GeneralFunctions.openUrl(facebookUrl),
            ),
            ContactIcon(
              svgPath: 'assets/icons/watsApp.svg',
              onPress: () => GeneralFunctions.openUrl(watsApp),
            ),
            ContactIcon(
              svgPath: 'assets/icons/phone.svg',
              onPress: () => GeneralFunctions.openUrl(mobileNumber),
            ),
          ],
        ),
      ),
    );
  }
}
