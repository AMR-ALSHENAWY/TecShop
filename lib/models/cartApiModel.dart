import 'package:tecshop_git/models/productModel.dart';

class CartApiModel {
  final double quantity;
  final ProductModel productData;

  CartApiModel({
    this.quantity,
    this.productData,
  });

  factory CartApiModel.fromJson(Map<String, dynamic> json) => CartApiModel(
        quantity: json["quantity"].toDouble(),
        productData: json["productData"] != null
            ? ProductModel.fromJson(
                json["productData"],
              )
            : null,
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "productData": productData.toJson(),
      };
}
