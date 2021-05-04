import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecshop_git/generalFunctions.dart';
import 'package:tecshop_git/globalWidgets/circleIcon.dart';
import 'package:tecshop_git/models/productModel.dart';
import 'package:tecshop_git/providers/FavoriteProvider.dart';
import 'package:tecshop_git/themes/light_color.dart';
class FavoriteButton extends StatelessWidget {
  final ProductModel productModel;
  final double iconSize;


  const FavoriteButton({Key key, this.productModel, this.iconSize=35}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(
      builder:
          (context, favoriteProv, _) =>
          CircleIcon(
            icon: Icon(
              favoriteProv.findFavoriteProduct( productModel.id) == null
                  ? Icons.favorite_border
                  : Icons.favorite,
              color: LightColors.primaryColor,

            ),
            borderColor:
            favoriteProv.isInFavoriteList(productModel.id)
                ? LightColors.primaryColor
                : Colors.grey.withOpacity(0.22),
            size: iconSize,
            onPress: () async {
              try {
                favoriteProv.isInFavoriteList(productModel.id)
                    ? await favoriteProv.removeFavoriteItem( productModel)
                    : await favoriteProv.addToFavoriteList(  productModel);
              } catch (e) {
                print(e);
                GeneralFunctions.showToast(e.toString(), Colors.red);
              }
            },
          ),
    );
  }
}
