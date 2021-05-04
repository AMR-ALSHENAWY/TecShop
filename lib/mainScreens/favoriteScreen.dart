import 'package:flutter/material.dart';
import 'package:tecshop_git/globalWidgets/appBars.dart';
import 'package:tecshop_git/screenWidgets/favoriteScreen/favoriteProductGrid.dart';

class FavoriteScreen extends StatelessWidget {
  static const String routName = '/favoriteScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarClass.favoriteAppBar(context),
      body: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.only(bottom: 10),
        child: FavoriteProductGrid(),
      ),
    );
  }
}
