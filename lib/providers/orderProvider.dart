import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tecshop_git/config/apiConstants.dart';
import 'package:tecshop_git/models/orderModel.dart';
import 'package:tecshop_git/models/productModel.dart';
import 'package:http/http.dart' as http;
import 'authProvider.dart';

class OrderProvider with ChangeNotifier {
  AuthProvider authProv;
  String hostUrl = ApiPaths.hostUrl;
  List<OrderModel> _orderList = [];

  List<OrderModel> get orderList => _orderList;

  //----------------------------------------------------------------------------------------------------------------------------------------------------

  Future<void> loadOrderList(List<OrderModel> userOrderList) async {
    _orderList = userOrderList.reversed.toList();
    notifyListeners();
  }

  //---------------------------------------------------------------------------------------------------------------------------------------------------
  Future<void> addOrder(OrderModel orderModel) async {
    try {
      final url = Uri.https('$hostUrl', '/order/createOrder');
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": 'Bearer ${authProv.token}',
        },
        body: orderToJson(orderModel),
      );
      final responseData = response.body;
      final statusCode = response.statusCode;
      if (statusCode >= 400) {
        throw 'Can\'t create the order';
      } else if (statusCode == 200 || statusCode == 201) {
        OrderModel createdOrder = OrderModel.fromJson(jsonDecode(responseData)['order']);
        _orderList.insert(0, createdOrder);
        notifyListeners();
      } else {
        throw 'Can\'t create the order';
      }
    } catch (error) {
      print(error);
      throw error;
    }
  }

  //---------------------------------------------------------------------------------------------------------------------------------------------------
  List<ProductModel> copyCartList(List<ProductModel> cartList) {
    List<ProductModel> cartListCopy = [];
    cartList.forEach((element) {
      cartListCopy.add(ProductModel(
        id: element.id,
        title: element.title,
        description: element.description,
        price: element.price,
        discount: element.discount,
        availableQuantity: element.availableQuantity,
        quantity: element.quantity,
        imageUrl: element.imageUrl,
        categoryId: element.categoryId,
        createdAt: element.createdAt,
        updatedAt: element.updatedAt,
      ));
    });
    return cartListCopy;
  }
}
