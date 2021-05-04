import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tecshop_git/globalWidgets/appBars.dart';
import 'package:tecshop_git/globalWidgets/offerBatch.dart';
import 'package:tecshop_git/mainScreens/showImageScreen.dart';
import 'package:tecshop_git/models/productModel.dart';
import 'package:tecshop_git/screenWidgets/product/cartButton.dart';
import 'package:tecshop_git/screenWidgets/product/favoriteButton.dart';
import 'package:tecshop_git/screenWidgets/product/shareButton.dart';
import 'package:tecshop_git/screenWidgets/productDetailsScreen/brandNameAndPrice.dart';
import 'package:tecshop_git/screenWidgets/productDetailsScreen/productDetails.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel productData;

  ProductDetailsScreen({Key key, this.productData}) : super(key: key);
  static const String routName = '/productDetailsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBarClass.productDetailsAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ///image
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (_) => ShowImageScreen(imageUrl: productData.imageUrl),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(10),
                      child: FadeInImage(
                        placeholder: AssetImage('assets/images/tecshopIcon.png'),
                        image: NetworkImage(productData.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  ///Offer Patch
                  Positioned(
                    top: 10,
                    left: 10,
                    child: productData.discount != 0
                        ? OfferBatch(
                            text: 'Get ${productData.discount.toInt()}% off',
                          )
                        : Text(''),
                  ),
                ],
              ),
            ),

            ///name and price
            NameAndPrice(productData: productData),
            Divider(height: 20, thickness: 5, color: Colors.grey.withOpacity(0.12)),

            ///cart - favorite - share
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (productData.availableQuantity != 0) CartButton(iconSize: 40, productModel: productData),
                FavoriteButton(iconSize: 40, productModel: productData),
                ShareButton(iconSize: 40)
              ],
            ),

            Divider(height: 20, thickness: 5, color: Colors.grey.withOpacity(0.12)),

            ///details
            ProductDetails(productData: productData)
          ],
        ),
      ),
      // ),
    );
  }
}
