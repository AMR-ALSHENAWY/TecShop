import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tecshop_git/models/categoryModel.dart';
import 'package:tecshop_git/themes/light_color.dart';
import 'backBtnPop.dart';
import 'cartBadge.dart';

class AppBarClass {
  static favoriteAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/favorite.1.svg',
            height: 25,
          ),
          SizedBox(width: 7),
          Container(
            child: Text(
              'Favorites',
              style: Theme.of(context).textTheme.headline1.copyWith(color: LightColors.primaryColor, fontSize: 22),
            ),
          ),
        ],
      ),
      actions: [
        CartBadge(),
        SizedBox(
          width: 10,
        )
      ],
    );
  }

//-------------------------------------------------------------------------------------------------------------------------------------------------
  static cartAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: InkWell(
        borderRadius: BorderRadius.circular(50),
        child: BackBtnPop(),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      title: Container(
        child: Text(
          'Cart',
          style: Theme.of(context).textTheme.headline1.copyWith(color: LightColors.primaryColor, fontSize: 20),
        ),
      ),
    );
  }

//-------------------------------------------------------------------------------------------------------------------------------------------------

  static offerScreenAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      actions: <Widget>[
        CartBadge(),
      ],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/offer.3.svg',
            height: 25,
          ),
          SizedBox(
            width: 7,
          ),
          Container(
            child: Text(
              'Offers',
              style: Theme.of(context).textTheme.headline1.copyWith(color: LightColors.primaryColor, fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }

  //-------------------------------------------------------------------------------------------------------------------------------------------------

  static productDetailsAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: BackBtnPop(),
      actions: <Widget>[
        CartBadge(),
      ],
    );
  }

  //-------------------------------------------------------------------------------------------------------------------------------------------------

  static productScreenAppBar(CategoryModel categoryModel, BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: BackBtnPop(),
      actions: <Widget>[
        CartBadge(),
      ],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.network(
            categoryModel.imageUrl,
            height: 25,
          ),
          SizedBox(width: 7),
          Container(
            margin: EdgeInsets.all(3),
            child: Text(
              categoryModel.name,
              style: Theme.of(context).textTheme.headline1.copyWith(color: LightColors.primaryColor, fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }
//-------------------------------------------------------------------------------------------------------------------------------------------------

}
