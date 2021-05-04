import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:tecshop_git/mainScreens/contactUsScreen.dart';
import 'package:tecshop_git/mainScreens/editProfileScreen.dart';
import 'package:tecshop_git/mainScreens/orderScreen.dart';
import 'package:tecshop_git/providers/authProvider.dart';
import 'package:tecshop_git/screenWidgets/profileScreen/goToBtnCard.dart';
import 'package:tecshop_git/generalFunctions.dart';

class ProfileScreenItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      children: <Widget>[
        GoToBtnCard(
          itemName: 'Orders',
          svgImage: 'assets/icons/order.svg',
          onPress: () {
            Navigator.push(context, CupertinoPageRoute(builder: (_) => OrderScreen()));
          },
        ),
        GoToBtnCard(
          itemName: 'Edit Profile',
          svgImage: 'assets/icons/edit.svg',
          onPress: () {
            Navigator.push(context, CupertinoPageRoute(builder: (_) => EditProfileScreen()));
          },
        ),
        GoToBtnCard(
          itemName: 'Rate App',
          svgImage: 'assets/icons/rate.svg',
          onPress: () => GeneralFunctions.openUrl('https://play.google.com/store/apps/details?id=tecshop.com'),
        ),
        GoToBtnCard(
            itemName: 'Share App',
            svgImage: 'assets/icons/share.svg',
            onPress: () async {
              await Share.share('TecShop : Online Shopping application\n https://play.google.com/store/apps/details?id=tecshop.com');
            }),
        GoToBtnCard(
          itemName: 'Contact us',
          svgImage: 'assets/icons/aboutColor.svg',
          onPress: () {
            Navigator.push(context, CupertinoPageRoute(builder: (_) => ContactUsScreen()));
          },
        ),
        GoToBtnCard(
          itemName: 'Logout',
          svgImage: 'assets/icons/logout.svg',
          onPress: () {
            Provider.of<AuthProvider>(context, listen: false).logOut();
          },
        ),
      ],
    );
  }
}
