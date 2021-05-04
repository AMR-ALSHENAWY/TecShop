import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tecshop_git/generalFunctions.dart';
import 'package:tecshop_git/globalWidgets/circleIcon.dart';
import 'package:tecshop_git/mainScreens/productDetailsScreen.dart';
import 'package:tecshop_git/models/productModel.dart';
import 'package:tecshop_git/providers/cartProvider.dart';
import 'package:tecshop_git/providers/productProvider.dart';
import 'package:tecshop_git/themes/light_color.dart';

class CartItem extends StatefulWidget {
  final ProductModel cartProdData;

  CartItem({Key key, this.cartProdData}) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context, listen: false);
    return AbsorbPointer(
      absorbing: _isLoading,
      child: Consumer<CartProvider>(
        builder: (context, cartProv, _) => InkWell(
          child: Card(
            child: Container(
              height: 120,
              padding: EdgeInsets.all(7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /**image
                       *
                       */
                  Expanded(
                    flex: 20,
                    child: FadeInImage(
                      placeholder: AssetImage('assets/images/tecshopIcon.png'),
                      image: NetworkImage(
                        widget.cartProdData.imageUrl,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),

                  /**title
                       *
                       */
                  Flexible(
                    flex: 50,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.cartProdData.title,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 10),

                        ///quantity row
                        quantityRow(widget.cartProdData),
                      ],
                    ),
                  ),

                  ///delete icon
                  deleteButton(),
                ],
              ),
            ),
          ),
          onTap: () {
            productProvider.currentProductModel = widget.cartProdData;
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (_) => ProductDetailsScreen(productData: widget.cartProdData),
              ),
            );
          },
        ),
      ),
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
*
*
*
 */
  Widget quantityRow(ProductModel productModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /**minus icon
         *
         */
        Consumer<CartProvider>(
          builder: (context, cartProv, _) => CircleIcon(
            size: 35,
            icon: Icon(Icons.remove),
            fillColor: Colors.grey.withOpacity(0.25),
            iconColor: Colors.black,
            onPress: () async {
              try {
                if (widget.cartProdData.quantity > 1) {
                  loadingIndicator(true);
                  await cartProv.changeQuantity(product: widget.cartProdData, increase: false);
                  loadingIndicator(false);
                }
              } catch (e) {
                print(e);
                loadingIndicator(false);
                GeneralFunctions.showToast(e.toString(), Colors.red);
              }
            },
          ),
        ),
        /**quantity
         *
         */
        Consumer<CartProvider>(builder: (context, cartProv, _) {
          return FittedBox(
            child: _isLoading
                ? SpinKitCircle(size: 25, color: Colors.black)
                : Text(
                    '${widget.cartProdData.quantity.toInt()}',
                    style: Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
          );
        }),
        /**plus icon
         *
         */
        Consumer2<ProductProvider, CartProvider>(
          builder: (context, productProv, cartProv, _) => CircleIcon(
            size: 35,
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            fillColor: LightColors.primaryColor,
            iconColor: Colors.white,
            onPress: () async {
              loadingIndicator(true);
              try {
                await cartProv.changeQuantity(product: widget.cartProdData, increase: true);
                loadingIndicator(false);
              } catch (e) {
                print(e);
                loadingIndicator(false);
                GeneralFunctions.showToast(e.toString(), Colors.red);
              }
            },
          ),
        ),
      ],
    );
  }

//---------------------------------------------------------------------------------------------
  Widget deleteButton() {
    return Flexible(
      flex: 25,
      child: Container(
        alignment: Alignment.topRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Consumer<CartProvider>(
              builder: (context, cartProv, _) => _isLoading
                  ? SpinKitCircle(
                      size: 25,
                      color: Colors.red,
                    )
                  : IconButton(
                      icon: SvgPicture.asset(
                        "assets/icons/delete.svg",
                        height: 25,
                      ),
                      onPressed: () async {
                        try {
                          loadingIndicator(true);
                          await cartProv.removeCartItem(widget.cartProdData);
                          loadingIndicator(false);
                        } catch (e) {
                          print(e);
                          loadingIndicator(false);
                          GeneralFunctions.showToast(e.toString(), Colors.red);
                        }
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

//---------------------------------------------------------------------------------------------

  void loadingIndicator(bool isLoading) {
    _isLoading = isLoading;
    setState(() {});
  }
}
