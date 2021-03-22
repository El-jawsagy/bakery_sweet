// screen of app to navigator to it
import './views/auth/forget_pass.dart';
import './views/auth/signin_screen.dart';
import './views/auth/signup_screen.dart';
import './views/onbarding_screen.dart';
import './views/welcom_screen.dart';

//theme and colors
import './theme/theme.dart';

//pub and core package
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: CustomColors.mainColor,
      ),
      home: WelcomScreen(),
      routes: {
        OnBoardingScreen.routeNamed: (ctx) => OnBoardingScreen(),
        SignUpScreen.routeNamed: (ctx) => SignUpScreen(),
        SignInScreen.routeNamed: (ctx) => SignInScreen(),
        ForgetPassScreen.routeNamed: (ctx) => ForgetPassScreen(),
      },
    );
  }
}
