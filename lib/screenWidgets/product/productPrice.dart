import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecshop_git/models/productModel.dart';
import 'package:tecshop_git/providers/cartProvider.dart';

class ProductPrice extends StatelessWidget {
  final ProductModel productModel;

  const ProductPrice({Key key, this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Flexible(
      flex: 15,
      child: FittedBox(
        child: productModel.availableQuantity == 0
            ? Text(
                'Out of stock',
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.red[700],
                    ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${cartProvider.getDiscount(productModel.discount, productModel.price).toStringAsFixed(0)} EGP ',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  if (productModel.discount != 0)
                    Text(
                      '${productModel.price.toStringAsFixed(0)} EGP',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.w100, decoration: TextDecoration.lineThrough),
                    ),
                ],
              ),
      ),
    );
  }
}
