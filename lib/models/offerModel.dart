import 'dart:convert';

OfferModel offerFromJson(String str) => OfferModel.fromJson(json.decode(str));

class OfferModel {
  final String id;
  final String imageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  OfferModel({
    this.id,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
        id: json["_id"],
        imageUrl: json["imageUrl"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );
}

/*
*
*
*
*
*
*
* */
//-------------------------------------------------------------------------------------------------------------------------------
OfferListModel offerListFromJson(String str) => OfferListModel.fromJson(json.decode(str));

class OfferListModel {
  final String message;
  final int status;
  final List<OfferModel> offerList;

  OfferListModel({
    this.message,
    this.status,
    this.offerList,
  });

  factory OfferListModel.fromJson(Map<String, dynamic> json) => OfferListModel(
        message: json["message"],
        status: json["status"],
        offerList: List<OfferModel>.from(json["offerList"].map((x) => OfferModel.fromJson(x))),
      );
}
