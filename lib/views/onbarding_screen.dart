// this is widget shared in almost all screen in app
import '../views/signin_screen.dart';
import '../widgets/bottons_and_text_fields_materials.dart';

// screen of app to navigator to it
import 'signup_screen.dart';

//dummy data
import '../data/dummy_data.dart';

//theme and colors
import '../theme/theme.dart';

//pub and core package
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String routeNamed = "onboardingScreen";

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> posIndecator = ValueNotifier(0);

    return Scaffold(
      // backgroundColor: CustomColors.transparentColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/images/background_image.png",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.85,
            fit: BoxFit.contain,
          ),
          PageView.builder(
            itemBuilder: (ctx, index) =>
                _buildOnBoardingPageChild(ctx, onbardingPages[index]),
            onPageChanged: (val) {
              posIndecator.value = val;
            },
            itemCount: onbardingPages.length,
          ),
          Column(
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
                ctx: context,
                usedColor: CustomColors.mainColor,
                widthFactor: 0.8,
                childWidget: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignInScreen.routeNamed);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Center(
                      child: Text(
                        "Sign In",
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
                ctx: context,
                usedColor: CustomColors.greyColor,
                widthFactor: 0.8,
                childWidget: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignUpScreen.routeNamed);
                  },
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: CustomColors.titleBlackColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          )
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
          onbardingPage["title"],
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
            onbardingPage["sub_title"],
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
}
