import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecshop_git/themes/light_color.dart';
import 'package:tecshop_git/providers/cartProvider.dart';
import 'package:tecshop_git/screenWidgets/product/bottomButton.dart';

class CompleteOrderBtn extends StatelessWidget {
  final Function onPress;

  const CompleteOrderBtn({Key key, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(5),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total order price',
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                        color: LightColors.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                Spacer(),
                Chip(
                  label: Consumer<CartProvider>(
                    builder: (context, cartProv, _) => Text(
                      cartProv.getTotalPrice().toStringAsFixed(2),
                      style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ),
                  backgroundColor: LightColors.primaryColor,
                ),
                //OrderButton(cart: cart)
              ],
            ),
            BottomButton(
              padding: 10,
              fontSize: 20,
              iconSize: 20,
              btnColor: LightColors.primaryColor,
              text: 'Complete your order',
              icon: Icons.verified_user,
              onTap: onPress,
            ),
          ],
        ),
      ),
    );
  }
}
