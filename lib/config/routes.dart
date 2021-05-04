import 'package:flutter/material.dart';
import 'package:tecshop_git/mainScreens/authScreen.dart';
import 'package:tecshop_git/mainScreens/cartScreen.dart';
import 'package:tecshop_git/mainScreens/contactUsScreen.dart';
import 'package:tecshop_git/mainScreens/editProfileScreen.dart';
import 'package:tecshop_git/mainScreens/favoriteScreen.dart';
import 'package:tecshop_git/mainScreens/offerProductScreen.dart';
import 'package:tecshop_git/mainScreens/orderScreen.dart';
import 'package:tecshop_git/mainScreens/productDetailsScreen.dart';
import 'package:tecshop_git/mainScreens/productScreen.dart';
import 'package:tecshop_git/mainScreens/profileScreen.dart';
import 'package:tecshop_git/mainScreens/splashScreen.dart';
import 'package:tecshop_git/mainScreens/showImageScreen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      ProductScreen.routeName: (ctx) => ProductScreen(),
      CartScreen.routName: (ctx) => CartScreen(),
      OfferProductScreen.routeName: (ctx) => OfferProductScreen(),
      ProductDetailsScreen.routName: (ctx) => ProductDetailsScreen(),
      ShowImageScreen.routName: (ctx) => ShowImageScreen(),
      FavoriteScreen.routName: (ctx) => FavoriteScreen(),
      ProfileScreen.routeName: (ctx) => ProfileScreen(),
      ContactUsScreen.routName: (ctx) => ContactUsScreen(),
      EditProfileScreen.routeName: (ctx) => EditProfileScreen(),
      OrderScreen.routeName: (ctx) => OrderScreen(),
      SplashScreen.routeName: (ctx) => SplashScreen(),
      AuthScreen.routeName: (ctx) => AuthScreen(),

      ///admin panel
/*  AdminContentScreen.routeName: (ctx) => AdminContentScreen(),
    StoreScreenAD.routeName: (ctx) => StoreScreenAD(),
    CategoryScreenAD.routeName: (ctx) => CategoryScreenAD(),
    BrandScreenAD.routeName: (ctx) => BrandScreenAD(),
    OfferScreenAD.routeName: (ctx) => OfferScreenAD(),

    NewProductScreenAD.routeName: (ctx) => NewProductScreenAD(),
    NewStoreScreenAD.routeName: (ctx) => NewStoreScreenAD(),
    NewCategoryScreenAD.routeName: (ctx) => NewCategoryScreenAD(),
    NewOfferScreenAD.routeName: (ctx) => NewOfferScreenAD(),
    StoreContentScreen.routeName: (ctx) => StoreContentScreen(),*/
    };
  }

}
