import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecshop_git/providers/authProvider.dart';
import 'package:tecshop_git/providers/genderProvider.dart';

import 'checkItemWidget.dart';

int _currentItem = 0;

class ChooseGenderType extends StatefulWidget {
  @override
  _ChooseOfferTypeState createState() => _ChooseOfferTypeState();
}

class _ChooseOfferTypeState extends State<ChooseGenderType> {
  @override
  void initState() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final genderProvider = Provider.of<GenderProvider>(context, listen: false);
    //To select the current gender in the initial state >>get the index of the current gender from genderList to be set
    //You have to take gender from authProvider as user data still as it is and don't change until you load data again
    _currentItem = genderProvider.getGenderIndex(authProvider.gender);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final genderProvider = Provider.of<GenderProvider>(context, listen: false);

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.grey[100]),
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
      child: Column(
        children: [
          ...List.generate(
            genderProvider.genderList.length,
            (index) => CheckItemWidget(
              text: genderProvider.genderList[index].typeName,
              isChecked: _currentItem == index,
              svgPath: genderProvider.genderList[index].svgPath,
              onPress: () {
                _currentItem = index;
                setState(() {});
                genderProvider.setGender(genderProvider.genderList[index].typeName);
              },
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
      //  ),
    );
  }
}

///you can use  the simple way for less number of choices
/*

int _currentItem = 0;

class ChooseGenderType extends StatefulWidget {
  @override
  _ChooseOfferTypeState createState() => _ChooseOfferTypeState();
}

class _ChooseOfferTypeState extends State<ChooseGenderType> {
  @override
  void initState() {
    final adminProvider = Provider.of<AuthProvider>(context, listen: false);

    adminProvider.gender == 'male' ? _currentItem = 0 : _currentItem = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.grey[100]),
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
      child: Column(
        children: [
          HeaderName(headerName: 'Gender Type'),
          CheckItemWidget(
            svgNetwork: false,
            text: 'Male',
            isChecked: _currentItem == 0,
            svgPath: 'assets/icons/male.svg',
            onPress: () {
              userProvider.tempGender = 'male';
              setState(() {
                _currentItem = 0;
                //adminProvider.offerType = 'new';
              });
            },
          ),
          SizedBox(
            height: 5,
          ),
          CheckItemWidget(
            svgNetwork: false,
            text: 'Female',
            isChecked: _currentItem == 1,
            svgPath: 'assets/icons/female.svg',
            onPress: () {
              setState(() {
                _currentItem = 1;
                userProvider.tempGender = 'female';
              });
            },
          ),
        ],
      ),
    );
  }
}

 */
