import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecshop_git/globalWidgets/appBars.dart';
import 'package:tecshop_git/globalWidgets/emptyMessage.dart';
import 'package:tecshop_git/providers/offerProvider.dart';
import 'package:tecshop_git/screenWidgets/offerScreen/offerGridProducts.dart';

class OfferProductScreen extends StatelessWidget {
  static const String routeName = '/offerProductScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBarClass.offerScreenAppBar(context),
      body: SafeArea(
        child: Selector<OfferProvider, bool>(
          selector: (context, offerProv) => offerProv.offerProductsLoaded,
          builder: (context, boolValue, child) => boolValue
              ? OfferGridProducts()
              : EmptyMessage(
                  message: 'NO PRODUCT',
                  imgSize: 140,
                ),
        ),
      ),
    );
  }
}
