import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:tecshop_git/generalFunctions.dart';
import 'package:tecshop_git/globalWidgets/circleIcon.dart';
import 'package:tecshop_git/globalWidgets/offerBatch.dart';
import 'package:tecshop_git/mainscreens/productDetailsScreen.dart';
import 'package:tecshop_git/models/productModel.dart';
import 'package:tecshop_git/providers/cartProvider.dart';
import 'package:tecshop_git/providers/productProvider.dart';
import 'package:tecshop_git/screenWidgets/product/favoriteButton.dart';
import 'package:tecshop_git/screenWidgets/product/productPrice.dart';
import 'package:tecshop_git/themes/light_color.dart';

bool clicked = false;

class ProductItem extends StatefulWidget {
  final ProductModel productData;
  final bool pushReplace;

  ProductItem({Key key, this.productData, this.pushReplace = false}) : super(key: key);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    print('build productItem');
    final productProvider = Provider.of<ProductProvider>(context, listen: false);
    return Stack(
      children: [
        InkWell(
          focusColor: Colors.white,
          borderRadius: BorderRadius.circular(12),
          splashColor: Colors.white,
          child: Card(
            margin: EdgeInsets.all(5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              width: 180,
              padding: EdgeInsets.all(7),
              // margin: EdgeInsets.all(5),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.withOpacity(0.22), width: 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 50,
                    child: Container(
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          /**image
                           *
                           */
                          FadeInImage(
                            placeholder: AssetImage('assets/images/tecshopIcon.png'),
                            image: NetworkImage(widget.productData.imageUrl),
                            fit: BoxFit.cover,
                          ),
                          if (widget.productData.discount != 0)
                            OfferBatch(
                              text: 'Get ${widget.productData.discount.toInt()}% off',
                            ),
                        ],
                      ),
                    ),
                  ),

                  /**name
                   *
                   */
                  Flexible(
                    flex: 20,
                    child: Text(
                      widget.productData.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                  SizedBox(height: 4),
                  /**price
                   *
                   */
                  ProductPrice(
                    productModel: widget.productData,
                  ),
                  SizedBox(height: 4),
                  /**Cart - favorite
                   *
                   */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /*CartButton(
                        productModel: widget.productData,
                      ),*/
                      if (widget.productData.availableQuantity != 0) cartBtn(widget.productData),
                      FavoriteButton(
                        productModel: widget.productData,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            productProvider.currentProductModel = widget.productData;
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (_) => ProductDetailsScreen(productData: widget.productData),
              ),
            );
          },
        ),
      ],
    );
  }

/*
*
*
*
*
*
*
*
*
*
* */
  Widget cartBtn(ProductModel productModel) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return CircleIcon(
      borderColor: LightColors.primaryColor,
      size: 35,
      icon: _isLoading
          ? SpinKitCircle(color: Colors.white, size: 25)
          : Icon(
              Icons.add_shopping_cart_rounded,
              color: Colors.white,
            ),
      fillColor: LightColors.primaryColor,
      onPress: () async {
        loadingIndicator(true);
        try {
          if (cartProvider.findCartProduct(productModel.id) == null) {
            await cartProvider.addToCartList(productModel);
            loadingIndicator(false);
          } else {
            await cartProvider.changeQuantity(product: productModel, increase: true);
            loadingIndicator(false);
          }
        } catch (e) {
          loadingIndicator(false);
          GeneralFunctions.showToast(e.toString(), Colors.red);
        }
      },
      // ),
    );
  }

//------------------------------------------------------------------------------------------------------
  void loadingIndicator(bool isLoading) {
    _isLoading = isLoading;
    setState(() {});
  }
}
