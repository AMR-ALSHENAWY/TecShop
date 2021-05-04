import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:tecshop_git/generalFunctions.dart';
import 'package:tecshop_git/themes/light_color.dart';
import 'package:tecshop_git/globalWidgets/circleIcon.dart';
import 'package:tecshop_git/models/productModel.dart';
import 'package:tecshop_git/providers/cartProvider.dart';

class CartButton extends StatefulWidget {
  final ProductModel productModel;
  final double iconSize;

  const CartButton({Key key, this.productModel, this.iconSize = 35}) : super(key: key);

  @override
  _CartButtonState createState() => _CartButtonState();
}

bool _isLoading = false;

class _CartButtonState extends State<CartButton> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return CircleIcon(
      borderColor: LightColors.primaryColor,
      size: widget.iconSize,
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
          if (cartProvider.findCartProduct(widget.productModel.id) == null) {
            await cartProvider.addToCartList(widget.productModel);
            loadingIndicator(false);
          } else {
            await cartProvider.changeQuantity(product: widget.productModel, increase: true);
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

/*
*
*
*
*
*
*
 */
  void loadingIndicator(bool isLoading) {
    _isLoading = isLoading;
    setState(() {});
  }
}
