import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tecshop_git/globalWidgets/headerWithTail.dart';
import 'package:tecshop_git/themes/light_color.dart';
import 'package:tecshop_git/globalWidgets/emptyMessage.dart';
import 'package:tecshop_git/providers/orderProvider.dart';
import 'package:tecshop_git/screenWidgets/orderScreen/orderDetailsBsheet.dart';
import 'package:tecshop_git/screenWidgets/orderScreen/orderItem.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  static const String routeName = '/orderScreen';

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: LightColors.primaryColor,
      body: Column(
        children: <Widget>[
          HeaderWithTail(headerColor: LightColors.primaryColor, headerTitle: '  My Orders'),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
              child: Container(
                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.12), borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
                child: orderProvider.orderList.length == 0
                    ? EmptyMessage(
                        message: 'NO ORDERS',
                        imgSize: 140,
                        fontColor: Colors.green[400],
                      )
                    :

                    ///Order list
                    ListView.builder(
                        padding: EdgeInsets.all(3),
                        physics: BouncingScrollPhysics(),
                        itemCount: orderProvider.orderList.length,
                        itemBuilder: (ctx, index) {
                          return OrderItem(
                            key: ValueKey(orderProvider.orderList[index].id),
                            orderData: orderProvider.orderList[index],
                            onPress: () {
                              return showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (context) {
                                  return OrderDetailsBSheet(
                                    orderData: orderProvider.orderList[index],
                                  );
                                },
                              );
                            },
                          );
                        }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
