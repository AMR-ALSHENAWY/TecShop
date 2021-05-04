import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tecshop_git/themes/light_color.dart';
import 'package:tecshop_git/mainScreens/cartScreen.dart';
import 'package:tecshop_git/providers/cartProvider.dart';
import 'package:provider/provider.dart';

class CartBadge extends StatelessWidget {
  CartBadge({
    Key key,
    this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          iconSize: 25,
          icon: SvgPicture.asset('assets/icons/shopping_cart.svg'),
          onPressed: () {
            Navigator.push(context, CupertinoPageRoute(builder: (_) => CartScreen()));
          },
        ),
        Positioned(
          right: 3,
          top: 5,
          child: Container(
            height: 20,
            width: 20,
            padding: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              color: LightColors.primaryColor,
              shape: BoxShape.circle,
              border: Border.all(width: 1.5, color: Colors.white),
            ),

            child: Consumer<CartProvider>(
              builder: (context, cartProv, _) => FittedBox(
                child: Center(
                  child: Text(
                    cartProv.cartList.length.toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
