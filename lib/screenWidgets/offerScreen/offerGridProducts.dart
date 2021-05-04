import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tecshop_git/providers/offerProvider.dart';
import 'package:tecshop_git/screenWidgets/product/productItem.dart';

class OfferGridProducts extends StatefulWidget {
  @override
  _GridItemsState createState() => _GridItemsState();
}

class _GridItemsState extends State<OfferGridProducts> {
  @override
  Widget build(BuildContext context) {
    final offerProvider = Provider.of<OfferProvider>(context, listen: false);
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: offerProvider.offerProductList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: ScreenUtil().screenWidth > 450 ? 3 : 2,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return ProductItem(
              productData: offerProvider.offerProductList[index],
            );
          },
        ),
      ],
    );
  }
}
