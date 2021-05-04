import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tecshop_git/mainScreens/favoriteScreen.dart';
import 'package:tecshop_git/mainScreens/homeScreenContent.dart';
import 'package:tecshop_git/mainScreens/offerProductScreen.dart';
import 'package:tecshop_git/mainScreens/profileScreen.dart';

class BottomNavigationBarContent {
  static List<Widget> bottomNavigationBarIcons = [
    SvgPicture.asset('assets/icons/home.svg', height: 35),
    SvgPicture.asset('assets/icons/offer.svg', height: 35),
    SvgPicture.asset('assets/icons/favorite.svg', height: 35),
    SvgPicture.asset('assets/icons/profile.svg', height: 35),
  ];
  static List<Widget> bottomScreens = <Widget>[
    HomeScreenContent(),
    OfferProductScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];
}
