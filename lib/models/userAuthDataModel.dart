import 'package:tecshop_git/config/enums.dart';

class UserAuthDataModel {
  final String email;
  final String password;
  final String name;
  final String phoneNumber;
  final AuthMode authType;
  final String gender;

  UserAuthDataModel({
    this.email,
    this.password,
    this.name,
    this.phoneNumber,
    this.authType,
    this.gender = 'Male',
  });
}
