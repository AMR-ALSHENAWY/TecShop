import 'dart:convert';

ProductModel productFromJson(String str) => ProductModel.fromJson(json.decode(str));

class ProductModel {
  final String id;
  final String imageUrl;
  final double discount;
  final double availableQuantity;
  double quantity;
  final String categoryId;
  final String title;
  final String description;
  final double price;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductModel({
    this.imageUrl,
    this.discount,
    this.availableQuantity,
    this.quantity = 1,
    this.categoryId,
    this.id,
    this.title,
    this.description,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["_id"],
        imageUrl: json['imageUrl'],
        discount: json["discount"].toDouble(),
        availableQuantity: json["availableQuantity"].toDouble(),
        quantity: json["quantity"].toDouble(),
        categoryId: json['categoryId'],
        title: json["title"],
        description: json["description"],
        price: json["price"].toDouble(),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "imageUr": imageUrl,
        "discount": discount,
        "availableQuantity": availableQuantity,
        "categoryId": categoryId,
        "title": title,
        "description": description,
        "price": price,
        "quantity": quantity ?? 1,
      };
}

//-----------------------------------------------------------------------------------------------------------------------------------

ProductListModel productListFromJson(String str) => ProductListModel.fromJson(json.decode(str));

class ProductListModel {
  ProductListModel({
    this.message,
    this.status,
    this.productList,
  });

  final String message;
  final int status;
  final List<ProductModel> productList;

  factory ProductListModel.fromJson(Map<String, dynamic> json) => ProductListModel(
      message: json["message"],
      status: json["status"],
      productList: List<ProductModel>.from(
        json["products"].map((x) => ProductModel.fromJson(x)),
      ));
}
