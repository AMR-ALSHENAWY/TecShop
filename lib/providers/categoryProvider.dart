import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:tecshop_git/config/apiConstants.dart';
import 'package:tecshop_git/models/categoryModel.dart';
import 'package:tecshop_git/models/httpException.dart';

import 'authProvider.dart';

class CategoryProvider with ChangeNotifier {
  AuthProvider authProv;

  CategoryModel currentCategoryModel;
  List<CategoryModel> _categoryList = [];

  List<CategoryModel> get categoryList => _categoryList;

  Future<void> loadCategories() async {
    final url = Uri.https('${ApiPaths.hostUrl}', '/category/getCategories');
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
        _categoryList = categoryListFromJson(responseData).categoryList;
        notifyListeners();
      } else {
        throw HttpException('Can\'t load stores data');
      }
    } catch (error) {
      print(error.toString());
      throw error;
    }
  }
}
