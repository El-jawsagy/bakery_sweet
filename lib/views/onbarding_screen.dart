// this is widget shared in almost all screen in app
import 'package:bakery_sweet/lang/applocate.dart';

import '../widgets/bottons_and_text_fields_materials.dart';

// screen of app to navigator to it
import './auth/signup_screen.dart';
import './auth/signin_screen.dart';

//dummy data
import '../data/dummy_data.dart';

//theme and colors
import '../theme/theme.dart';

//pub and core package
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  static final String routeNamed = "onboardingScreen";
  final ValueNotifier<int> posIndecator = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: CustomColors.transparentColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          //back ground image
          backGroundImage(ctx: context),

          //pageview to show screen on onboarding
          PageView.builder(
            itemBuilder: (ctx, index) =>
                _buildOnBoardingPageChild(ctx, onbardingPages[index]),
            onPageChanged: (val) {
              posIndecator.value = val;
            },
            itemCount: onbardingPages.length,
          ),

          //column to show dots indecator and button of Sign in or sign up
          _buildContainerOfIndecaorAndButtons(mainCtx: context),
        ],
      ),
    );
  }

  Widget _buildOnBoardingPageChild(
      context, Map<String, dynamic> onbardingPage) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          onbardingPage["image"],
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.3,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          AppLocale.of(context).getTranslated("language") == "ar"
              ? onbardingPage["title-ar"]
              : onbardingPage["title-en"],
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: CustomColors.mainColor,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Text(
            AppLocale.of(context).getTranslated("language") == "ar"
                ? onbardingPage["sub_title-ar"]
                : onbardingPage["sub_title-en"],
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: CustomColors.subTitleColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  _buildContainerOfIndecaorAndButtons({BuildContext mainCtx}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ValueListenableBuilder(
          valueListenable: posIndecator,
          builder: (BuildContext context, value, Widget child) {
            return DotsIndicator(
              dotsCount: onbardingPages.length,
              position: posIndecator.value.toDouble(),
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                color: CustomColors.greyColor,
                activeColor: CustomColors.mainColor,
              ),
            );
          },
        ),
        SizedBox(
          height: 10,
        ),
        roundedButtonContainer(
          ctx: mainCtx,
          usedColor: CustomColors.mainColor,
          widthFactor: 0.8,
          childWidget: TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                mainCtx,
                SignInScreen.routeNamed,
              );
            },
            child: Container(
              width: MediaQuery.of(mainCtx).size.width * 0.8,
              child: Center(
                child: Text(
                  AppLocale.of(mainCtx).getTranslated("login"),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: CustomColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        roundedButtonContainer(
          ctx: mainCtx,
          usedColor: CustomColors.greyColor,
          widthFactor: 0.8,
          childWidget: TextButton(
            onPressed: () {
              Navigator.pushNamed(mainCtx, SignUpScreen.routeNamed);
            },
            child: Container(
              width: MediaQuery.of(mainCtx).size.width * 0.8,
              child: Center(
                child: Text(
                  AppLocale.of(mainCtx).getTranslated("create_account"),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: CustomColors.titleBlackColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
