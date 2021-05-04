import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tecshop_git/config/changeNotifierProviders.dart';
import 'package:tecshop_git/config/routes.dart';
import 'package:tecshop_git/providers/authProvider.dart';
import 'package:tecshop_git/themes/theme.dart';
import 'mainScreens/authScreen.dart';
import 'mainScreens/homeScreenRoot.dart';
import 'mainScreens/splashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MultiProvider(
      providers: ChangeNotifierProviders.changeNotifierProviders,
      child: Consumer<AuthProvider>(
        builder: (ctx, auth, _) => ScreenUtilInit(
          builder: () => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            home: auth.isAuth
                ? HomeScreen()
                : FutureBuilder(
                    future: auth.tryAutoLogIn(),
                    builder: (ctx, authResultSnapshot) => authResultSnapshot.connectionState == ConnectionState.waiting
                        ? SplashScreen()
                        : AuthScreen(),
                  ),
            routes: Routes.getRoute(),
          ),
        ),
      ),
    );
  }
}
