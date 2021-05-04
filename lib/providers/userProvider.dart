import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:tecshop_git/config/apiConstants.dart';
import 'package:tecshop_git/models/userModel.dart';
import 'package:http/http.dart' as http;
import 'authProvider.dart';

class UserProvider with ChangeNotifier {
  UserModel userData;
  AuthProvider authProv;
  String hostUrl = ApiPaths.hostUrl;

  Future<void> loadUserData() async {
    final url = Uri.https('$hostUrl', '/user/getUser/${authProv.userId}');
    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer ${authProv.token}',
        },
      );

      final responseData = response.body;
      print(responseData);
      final statusCode = response.statusCode;
      if (statusCode >= 400) {
        throw HttpException(jsonDecode(responseData)['message']);
      } else if (statusCode == 200 || statusCode == 201) {
        userData = UserModel.fromJson(jsonDecode(responseData)['user']);
        notifyListeners();
      } else {
        throw HttpException('Can\'t load user');
      }
    } catch (error) {
      print(error.toString());
      throw error;
    }
  }
}
