import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tecshop_git/globalWidgets/emptyMessage.dart';
import 'package:tecshop_git/providers/FavoriteProvider.dart';
import 'package:tecshop_git/screenWidgets/product/productItem.dart';

class FavoriteProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(
      builder: (context, favoriteProv, _) => Expanded(
        child: favoriteProv.favoriteList.length == 0
            ? EmptyMessage(message: 'Favorite is empty', imgSize: 130)
            : GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: favoriteProv.favoriteList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: ScreenUtil().screenWidth > 450 ? 3 : 2,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) => ProductItem(productData: favoriteProv.favoriteList[index]),
              ),
      ),
    );
  }
}
