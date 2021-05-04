import 'package:flutter/material.dart';
import 'package:tecshop_git/models/productModel.dart';
import 'package:tecshop_git/screenWidgets/homeScreen/titleHeaderSimple.dart';
import 'errorContainer.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel productData;

  ProductDetails({Key key, this.productData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleHeaderSimple(text: 'Product Details'),
          Container(
            margin: EdgeInsets.fromLTRB(7, 0, 7, 10),
            padding: EdgeInsets.all(5),
            child: productData.description != null
                ? Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      productData.description,
                      style: Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  )
                : ErrorContainer(
                    height: 70,
                    message: 'No details',
                  ),
          ),
        ],
      ),
    );
  }
}
