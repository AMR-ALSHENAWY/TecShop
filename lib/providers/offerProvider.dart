import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:tecshop_git/config/apiConstants.dart';
import 'package:tecshop_git/models/offerModel.dart';
import 'package:tecshop_git/models/productModel.dart';

import 'authProvider.dart';

class OfferProvider with ChangeNotifier {
  AuthProvider authProv;
  bool offerProductsLoaded = false;
  List<ProductModel> _offerProductList = [];
  List<OfferModel> _offerList = [];

  List<ProductModel> get offerProductList => _offerProductList;

  List<OfferModel> get offerList => _offerList;

  //----------------------------------------------------------------------------------------------------------------------
  void setOfferProductsLoaded() {
    //to change the value so that the selector feel changes and reload the future
    offerProductsLoaded = true;
    notifyListeners();
  }

//--------------------------------------------------------------------------------------------------------------------
  Future<void> loadOfferProductList({Map<String, dynamic> queryParams}) async {
    String queryString = Uri(queryParameters: queryParams).query;
    final url = "${ApiPaths.hostUrl}/product/productFilters?$queryString";
    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Authorization': 'Bearer ${authProv.token}',
      });
      final responseData = response.body;
      final statusCode = response.statusCode;
      if (statusCode >= 400) {
        throw HttpException(jsonDecode(responseData)['message']);
      } else if (statusCode == 200 || statusCode == 201) {
        List<ProductModel> loadedProductList = productListFromJson(responseData).productList;
        _offerProductList = loadedProductList;
        setOfferProductsLoaded();
      } else {
        throw 'Can\'t load offer products';
      }
    } catch (error) {
      throw 'Can\'t load offer products';
    }
  }

  ///*************************************************************************************************
  Future<void> loadOfferSlides() async {
    final url = Uri.https('${ApiPaths.hostUrl}', '/offer/getOffers');
    try {
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${authProv.token}',
        },
      );

      final responseData = response.body;
      final statusCode = response.statusCode;
      if (statusCode >= 400) {
        throw HttpException(jsonDecode(responseData)['message']);
      } else if (statusCode == 200 || statusCode == 201) {
        OfferListModel offerListModel = offerListFromJson(responseData);
        List<OfferModel> offerList = offerListModel.offerList;

        _offerList = offerList;
        notifyListeners();
      } else {
        throw HttpException('Can\'t load offers');
      }
    } catch (error) {
      throw error;
    }
  }
}
