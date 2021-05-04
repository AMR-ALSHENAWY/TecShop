import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tecshop_git/providers/productProvider.dart';
import 'package:tecshop_git/screenWidgets/product/productItem.dart';

class ProductGridItems extends StatefulWidget {
  @override
  _GridItemsState createState() => _GridItemsState();
}

class _GridItemsState extends State<ProductGridItems> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context, listen: false);
    return Stack(alignment: Alignment.topCenter, children: [
      GridView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: productProvider.productList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: ScreenUtil().screenWidth > 450 ? 3 : 2,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) => ProductItem(productData: productProvider.productList[index]),
      )
    ]);
  }
}
