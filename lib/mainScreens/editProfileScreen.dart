import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:tecshop_git/generalFunctions.dart';
import 'package:tecshop_git/globalWidgets/headerWithTail.dart';
import 'package:tecshop_git/globalWidgets/txtField.dart';
import 'package:tecshop_git/models/userAuthDataModel.dart';
import 'package:tecshop_git/providers/authProvider.dart';
import 'package:tecshop_git/providers/genderProvider.dart';
import 'package:tecshop_git/screenWidgets/editProfileScreen/chooseGenderType.dart';
import 'package:tecshop_git/themes/light_color.dart';

class EditProfileScreen extends StatefulWidget {
  static const String routeName = '/editProfileScreen';

  @override
  _NewOfferScreenADState createState() => _NewOfferScreenADState();
}

class _NewOfferScreenADState extends State<EditProfileScreen> {
  bool _isLoading = false;

  final _emailController = TextEditingController();
  final _userNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  final _form = GlobalKey<FormState>();


 @override
  void initState() {
   ///to fill fields values if editing
   initialFieldsIfEditing();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _userNameController.dispose();
    _phoneNumberController.dispose();
  }

//-----------------------------------------------------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: _isLoading,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.save,
            color: Colors.white,
          ),
          backgroundColor: Colors.greenAccent,
          onPressed: _saveForm,
        ),
        backgroundColor: LightColors.darkBlueColor,
        body: Column(
          children: <Widget>[
            /**Header
             *
             */
            HeaderWithTail(headerTitle: '  Edit Profile', headerColor: LightColors.darkBlueColor),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    )),
                child: Stack(
                  children: <Widget>[
                    /**Form
                     *
                     */
                    Form(
                      key: _form,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  /**email
                                   *
                                   */
                                  TxtField(
                                    textEditingController: _emailController,
                                    upperTitle: 'Email',
                                    hint: 'Ex : amr@gmail.com',
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter your Email';
                                      }
                                      return null;
                                    },
                                  ),
                                  /**user name
                                   *
                                   */
                                  TxtField(
                                    textEditingController: _userNameController,
                                    upperTitle: 'User name',
                                    hint: 'Ex : AMR',
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter your name';
                                      }
                                      return null;
                                    },
                                  ),
                                  /**Phone number
                                   *
                                   */
                                  TxtField(
                                    textEditingController: _phoneNumberController,
                                    upperTitle: 'Phone Number',
                                    hint: 'Ex : 01012345678',
                                    textInputType: TextInputType.number,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter a phone number';
                                      } else if (int.tryParse(value) == null
                                          // || !value.startsWith('01')
                                          ) {
                                        return 'Enter a valid phone number';
                                      } else if (value.toString().length != 11) {
                                        return 'phone number is not 11 digits';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 15),
                                  /**Choose gender
                                   *
                                   */
                                  ChooseGenderType(),
                                  SizedBox(height: 50),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (_isLoading)
                      Center(
                        child: SpinKitCircle(
                          color: LightColors.darkBlueColor,
                          size: 45,
                        ),
                      ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

/*
*
*
*
*
*
*
*
*
 */

  Future<void> _saveForm() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final genderProvider = Provider.of<GenderProvider>(context, listen: false);

    /**check validation
     *
     */
    final _isValid = _form.currentState.validate();
    if (!_isValid) {
      GeneralFunctions.showToast('Complete your data', Colors.red);
      return;
    }
    //close the keyBoard
    FocusScope.of(context).unfocus();
    loadingIndicator(true);
    /**Update
     *
     */
    try {
      await authProvider.updateUser(
        authDataModel: UserAuthDataModel(
          email: _emailController.text,
          name: _userNameController.text,
          phoneNumber: _phoneNumberController.text,
          gender: genderProvider.tempGender,
        ),
      );
      Navigator.pop(context);
      GeneralFunctions.showToast('Data updated successfully', Colors.green);
    } catch (error) {
      print(error);
      loadingIndicator(false);
      GeneralFunctions.showToast('Filed to save data', Colors.red);
    }
  }

/*
*
*
*
*
*
*
 */
  void initialFieldsIfEditing() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    _emailController.text = authProvider.email;
    _userNameController.text = authProvider.name;
    _phoneNumberController.text = authProvider.phoneNumber;
  }

  //------------------------------------------------------------------------------------------
  void loadingIndicator(bool isLoading) {
    _isLoading = isLoading;
    setState(() {});
  }
}
