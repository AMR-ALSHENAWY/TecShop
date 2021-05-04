import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tecshop_git/globalWidgets/appBars.dart';
import 'package:tecshop_git/globalWidgets/emptyMessage.dart';
import 'package:tecshop_git/globalWidgets/iconLabelButton.dart';
import 'package:tecshop_git/models/categoryModel.dart';
import 'package:tecshop_git/providers/categoryProvider.dart';
import 'package:tecshop_git/providers/productProvider.dart';
import 'package:provider/provider.dart';
import 'package:tecshop_git/screenWidgets/product/productGridItems.dart';
import 'package:tecshop_git/themes/light_color.dart';

class ProductScreen extends StatefulWidget {
  final CategoryModel categoryData;

  const ProductScreen({Key key, this.categoryData}) : super(key: key);
  static const String routeName = '/productScreen';

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context, listen: false);
    final categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBarClass.productScreenAppBar(categoryProvider.currentCategoryModel, context),
      body: FutureBuilder(
        future: productProvider.loadFilteredProductList(queryParams: {
          'categoryId': categoryProvider.currentCategoryModel.id,
        }),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SpinKitFadingFour(color: LightColors.primaryColor, size: 70);
          } else {
            if (snapshot.hasError) {
              return Center(
                child: IconLabelButton(
                  textColor: Colors.red,
                  fontSize: 20,
                  labelText: '  Refresh ',
                  childIcon: SvgPicture.asset(
                    'assets/icons/refresh.svg',
                    width: 35,
                  ),
                  onPress: () {
                    setState(() {});
                  },
                ),
              );
            }
            return productProvider.productList.isEmpty
                ? EmptyMessage(message: 'NO PRODUCT', imgSize: 140)
                : ProductGridItems();
          }
        },
      ),
    );
  }
}
