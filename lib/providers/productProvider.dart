import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:tecshop_git/config/apiConstants.dart';
import 'package:tecshop_git/models/productModel.dart';
import 'authProvider.dart';

class ProductProvider with ChangeNotifier {
  AuthProvider authProv;
  ProductModel currentProductModel;
  List<ProductModel> _productList = [];

  List<ProductModel> get productList => _productList;

//---------------------------------------------------------------------------------------------
  Future<void> loadFilteredProductList({Map<String, dynamic> queryParams}) async {
    String queryString = Uri(queryParameters: queryParams).query;
    final url = "${ApiPaths.hostUrl}/product/productFilters?$queryString";

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${authProv.token}',
        },
      );

      final responseData = response.body;
      final statusCode = response.statusCode;
      if (statusCode >= 400) {
        throw HttpException(jsonDecode(responseData)['message']);
      } else if (statusCode == 200 || statusCode == 201) {
        _productList = productListFromJson(responseData).productList;
      } else {
        throw 'Can\'t load product data';
      }
    } catch (error) {
      throw 'Can\'t load product data';
    }
  }

//------------------------------------------------------------------------------------------------------

}
