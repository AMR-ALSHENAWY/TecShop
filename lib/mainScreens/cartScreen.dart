import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:tecshop_git/generalFunctions.dart';
import 'package:tecshop_git/globalWidgets/appBars.dart';
import 'package:tecshop_git/globalWidgets/emptyMessage.dart';
import 'package:tecshop_git/models/orderModel.dart';
import 'package:tecshop_git/providers/authProvider.dart';
import 'package:tecshop_git/providers/cartProvider.dart';
import 'package:tecshop_git/providers/orderProvider.dart';
import 'package:tecshop_git/screenWidgets/cartScreen/cartItem.dart';
import 'package:tecshop_git/screenWidgets/cartScreen/completeOrderBtn.dart';
import 'package:tecshop_git/themes/light_color.dart';

import 'orderScreen.dart';

class CartScreen extends StatefulWidget {
  static const String routName = '/cartScreen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

bool _isLoading = false;

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
        absorbing: _isLoading,
        child: Scaffold(
          appBar: AppBarClass.cartAppBar(context),
          body: Stack(
            children: [
              Column(
                children: <Widget>[
                  /**CartList
                   *
                   */
                  Consumer<CartProvider>(
                    builder: (context, cartProv, _) => Expanded(
                      child: cartProv.cartList.length != 0
                          ? ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: cartProv.cartList.length,
                              itemBuilder: (ctx, index) => CartItem(
                                key: ValueKey(cartProv.cartList[index].id),
                                cartProdData: cartProv.cartList[index],
                              ),
                            )
                          : EmptyMessage(message: 'Cart is empty', imgSize: 130),
                      //),
                    ),
                  ),
                  SizedBox(height: 10),
                  /**Complete order Btn
                   *
                   */
                  CompleteOrderBtn(
                    onPress: () {
                      completeOrderProcess();
                    },
                  ),
                ],
              ),
              if (_isLoading)
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black.withOpacity(0.2),
                  child: Center(
                    child: SpinKitFadingFour(
                      color: LightColors.primaryColor,
                      size: 70,
                    ),
                  ),
                ),
            ],
          ),
        ));
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
*
*
 */

  void completeOrderProcess() async {
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (cartProvider.cartList.length == 0) {
      GeneralFunctions.showToast('Cart is empty!', Colors.blue, fontSize: 17);
      return;
    }
    showLoadingIndicator(true);
    try {
      await orderProvider.addOrder(
        OrderModel(
          userId: authProvider.userId,
          totalPrice: cartProvider.getTotalPriceDiscounted(),
          cartList: orderProvider.copyCartList(cartProvider.cartList),
        ),
      );
      cartProvider.clearCartList();
      Navigator.pushReplacementNamed(context, OrderScreen.routeName);
      showLoadingIndicator(false);
      GeneralFunctions.showToast('Your Order is Completed', Colors.green[300], fontSize: 17, long: true);
    } catch (e) {
      showLoadingIndicator(false);
      GeneralFunctions.showToast('Can\'t create the order', Colors.red);
      print(e);
    }
  }

//------------------------------------------------------------------------------------------------
  void showLoadingIndicator(bool boolValue) {
    _isLoading = boolValue;
    setState(() {});
  }
}
