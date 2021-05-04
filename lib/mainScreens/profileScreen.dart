import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tecshop_git/globalWidgets/headerWithLead.dart';
import 'package:tecshop_git/providers/authProvider.dart';
import 'package:tecshop_git/screenWidgets/profileScreen/profileScreenItems.dart';
import 'package:tecshop_git/themes/light_color.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profileScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.primaryColor,
      body: Column(
        children: <Widget>[
          /**Header
           *
           */
          Consumer<AuthProvider>(
            builder: (context, authProv, _) => HeaderWithLead(
              headerTitle: '  Hello ${authProv.name}',
              headerColor: LightColors.primaryColor,
              leadingIcon: SvgPicture.asset(
                'assets/icons/profile.3.svg',
                width: 30,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(color: LightColors.lightGreyColor, borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
              child: ProfileScreenItems(),
            ),
          ),
        ],
      ),
    );
  }
}
