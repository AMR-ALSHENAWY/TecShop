import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tecshop_git/providers/FavoriteProvider.dart';
import 'package:tecshop_git/providers/authProvider.dart';
import 'package:tecshop_git/providers/cartProvider.dart';
import 'package:tecshop_git/providers/categoryProvider.dart';
import 'package:tecshop_git/providers/genderProvider.dart';
import 'package:tecshop_git/providers/offerProvider.dart';
import 'package:tecshop_git/providers/orderProvider.dart';
import 'package:tecshop_git/providers/productProvider.dart';
import 'package:tecshop_git/providers/userProvider.dart';

class ChangeNotifierProviders {
  static List<SingleChildWidget> changeNotifierProviders = [
    ChangeNotifierProvider(create: (context) => AuthProvider()),
    ChangeNotifierProvider(create: (context) => CategoryProvider()),
    ChangeNotifierProvider(create: (context) => ProductProvider()),
    ChangeNotifierProvider(create: (context) => OrderProvider()),
    ChangeNotifierProvider(create: (context) => OfferProvider()),
    ChangeNotifierProvider(create: (context) => CartProvider()),
    ChangeNotifierProvider(create: (context) => FavoriteProvider()),
    ChangeNotifierProvider(create: (context) => GenderProvider()),
    ChangeNotifierProvider(create: (context) => UserProvider()),

    /*ChangeNotifierProxyProvider<AuthProvider, UserProvider>(
      create: (_) => UserProvider(),
      update: (_, authProv, userProv) => userProv..authProv = authProv,
    ),*/
  ];
}
