import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tecshop_git/globalWidgets/headerWithLead.dart';
import 'package:tecshop_git/globalWidgets/headerWithTail.dart';
import 'package:tecshop_git/screenWidgets/contactUsScreen/conactIconRow.dart';
import 'package:tecshop_git/screenWidgets/contactUsScreen/mercadoBtn.dart';
import 'package:tecshop_git/themes/light_color.dart';

class ContactUsScreen extends StatelessWidget {
  static const String routName = '/contactUsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.primaryColor,
      body: Column(
        children: <Widget>[
          /**Header
           *
           */
          HeaderWithTail(headerTitle: '  Contact us', headerColor: LightColors.primaryColor),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  /**HeadPhone card
                   *
                   */
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(200))),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: SvgPicture.asset(
                        'assets/icons/headPhone.svg',
                        width: 120,
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                  /**Contact icons
                   *
                   */
                  ContactIconRow(),
                  SizedBox(height: 50),
                  MercadoBtn()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
