import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecshop_git/models/productModel.dart';
import 'package:tecshop_git/providers/cartProvider.dart';

class NameAndPrice extends StatelessWidget {
  final ProductModel productData;

  const NameAndPrice({Key key, this.productData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Container(
      margin: EdgeInsets.fromLTRB(14, 0, 14, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /**Title
           *
           */
          Text(
            '${productData.title}',
            style: Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 12),
          productData.availableQuantity == 0
              ? Text(
                  'Out of stock',
                  style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.red[700]),
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///Price
                    Text(
                      '${cartProvider.getDiscount(productData.discount, productData.price).toStringAsFixed(1)} EGP ',
                      style: Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(width: 10),

                    ///Discount
                    if (productData.discount != 0)
                      Text(
                        '${productData.price.toStringAsFixed(1)} EGP',
                        style: Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 18, fontWeight: FontWeight.w200, decoration: TextDecoration.lineThrough),
                      ),
                  ],
                ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
