import 'dart:convert';

CategoryModel categoryFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  final String id;
  final String name;
  final String imageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  CategoryModel({
    this.id,
    this.name,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["_id"],
        name: json["name"],
        imageUrl: json["imageUrl"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "imageUrl": imageUrl,
      };
}

//-------------------------------------------------------------------------------------------------------------------------------
CategoryListModel categoryListFromJson(String str) => CategoryListModel.fromJson(json.decode(str));

class CategoryListModel {
  final String message;
  final int status;
  final List<CategoryModel> categoryList;

  CategoryListModel({
    this.message,
    this.status,
    this.categoryList,
  });

  factory CategoryListModel.fromJson(Map<String, dynamic> json) => CategoryListModel(
        message: json["message"],
        status: json["status"],
        categoryList: List<CategoryModel>.from(json["categoryList"].map((categoryObj) => CategoryModel.fromJson(categoryObj))),
      );
}
