import 'package:flutter/cupertino.dart';

class GenderProvider with ChangeNotifier {
  String tempGender = 'Male';

  List<GenderModel> get genderList => [
        GenderModel('Male', 'assets/icons/male.svg'),
        GenderModel('Female', 'assets/icons/female.svg'),
      ];

  int getGenderIndex(String genderType) {
    return genderList.indexWhere((element) => element.typeName == genderType);
  }

  void setGender(String gender) {
    tempGender = gender;
  }
}

//----------------------------------------------------------------------------------------------------
class GenderModel {
  final String typeName;
  final String svgPath;

  GenderModel(this.typeName, this.svgPath);
}
