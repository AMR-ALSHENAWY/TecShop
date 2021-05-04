import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tecshop_git/config/apiConstants.dart';
import 'package:tecshop_git/models/productModel.dart';

import 'authProvider.dart';

class FavoriteProvider with ChangeNotifier {
  AuthProvider authProv;
  String hostUrl = ApiPaths.hostUrl;
  List<ProductModel> _favoriteList = [];

  List<ProductModel> get favoriteList => _favoriteList;

//------------------------------------------------------------------------------------------------------------
  ProductModel findFavoriteProduct(String id) => _favoriteList.firstWhere((element) => element.id == id, orElse: () => null);

  //---------------------------------------------------------------------------------------------
  bool isInFavoriteList(String id) => findFavoriteProduct(id) != null;

  //---------------------------------------------------------------------------------------------

  Future<void> loadFavoriteProduct(List<ProductModel> userFavoriteList) async {
    _favoriteList = userFavoriteList;
    notifyListeners();
  }

//---------------------------------------------------------------------------------------------
  Future<void> addToFavoriteList(ProductModel product) async {
    _favoriteList.add(product);
    final existingProductIndex = _favoriteList.indexWhere((item) => item.id == product.id);
    notifyListeners();
    try {
      final url = Uri.https('$hostUrl', '/action/addToFavorite');
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${authProv.token}",
        },
        body: json.encode({
          "userId": authProv.userId,
          "productId": product.id,
        }),
      );
      final statusCode = response.statusCode;
      if (statusCode >= 400) {
        throw 'Failed to add to favorite';
      } else if (statusCode == 200 || statusCode == 201) {
      } else {
        throw 'Failed to add to favorite';
      }
    } catch (error) {
      _favoriteList.removeAt(existingProductIndex);
      notifyListeners();
      throw 'Failed to add to favorite';
    }
  }

  //---------------------------------------------------------------------------------------------
  Future<void> removeFavoriteItem(ProductModel product) async {
    try {
      final url = Uri.https('$hostUrl', '/action/removeFromFavorite/${authProv.userId}/${product.id}');
      final response = await http.delete(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${authProv.token}",
        },
      );
      final statusCode = response.statusCode;
      if (statusCode >= 400) {
        throw 'Failed to remove from favorite';
      } else if (statusCode == 200 || statusCode == 201) {
        _favoriteList.removeWhere((element) => element.id == product.id);
      } else {
        throw 'Failed to remove from favorite';
      }
    } catch (error) {
      throw 'Failed to remove from favorite';
    }
  }
}
