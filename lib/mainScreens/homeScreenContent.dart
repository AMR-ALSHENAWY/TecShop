import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tecshop_git/globalWidgets/iconLabelButton.dart';
import 'package:tecshop_git/providers/authProvider.dart';
import 'package:tecshop_git/providers/homeScreenProvider.dart';
import 'package:tecshop_git/screenWidgets/homeScreen/categoryList.dart';
import 'package:tecshop_git/screenWidgets/homeScreen/headerHomePage.dart';
import 'package:tecshop_git/screenWidgets/homeScreen/titleHeaderSimple.dart';
import 'package:tecshop_git/screenWidgets/offerScreen/carouselComponents/carouselDemo.dart';
import 'package:tecshop_git/themes/light_color.dart';

class HomeScreenContent extends StatefulWidget {
  final Function onPress;
  static const routeName = '/homeScreenContent';

  HomeScreenContent({Key key, this.onPress}) : super(key: key);

  @override
  _HomeScreenContentState createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: <Widget>[
            HeaderHomePage(),
            Divider(height: 2),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                child: FutureBuilder(
                    future: HomeScreenHelper().loadAllData(context),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SpinKitFadingFour(
                          color: LightColors.primaryColor,
                          size: 70,
                        );
                      } else {
                        if (snapshot.hasError) {
                          print(snapshot.error);
                          return Center(
                            child: IconLabelButton(
                              textColor: Colors.red,
                              fontSize: 20,
                              labelText: '  Refresh ',
                              childIcon: SvgPicture.asset(
                                'assets/icons/refresh.svg',
                                width: 35,
                              ),
                              onPress: () {
                                setState(() {});
                              },
                            ),
                          );
                        }
                        return RefreshIndicator(
                          onRefresh: () {
                            setState(() {});
                            return HomeScreenHelper().loadAllData(context);
                          },
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Consumer<AuthProvider>(
                                  builder: (context, authProv, _) => TitleHeaderSimple(text: 'Hello ${authProv.name}'),
                                ),
                                CarouselDemo(),
                                CategoryList(),
                              ],
                            ),
                          ),
                        );
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
