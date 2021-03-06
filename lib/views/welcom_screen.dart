// screen of app to navigator to it

import '../views/onbarding_screen.dart';

// this is widget shared in almost all screen in app
import '../widgets/bottons_and_text_fields_materials.dart';

//theme and colors
import '../theme/theme.dart';

//pub and core package
import 'package:flutter/material.dart';

//language
import '../lang/applocate.dart';

class WelcomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: CustomColors.transparentColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/images/welcom_image.png",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .35,
                color: CustomColors.mainColor.withOpacity(0.9),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocale.of(context).getTranslated("happy_meals"),
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.whiteColor,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocale.of(context)
                          .getTranslated("subtitle_happy_meals"),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: CustomColors.whiteColor,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //button to navigat to next screen

                    roundedButtonContainer(
                      ctx: context,
                      usedColor: CustomColors.whiteColor,
                      widthFactor: 0.45,
                      childWidget: TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, OnBoardingScreen.routeNamed);
                        },
                        child: Text(
                          AppLocale.of(context).getTranslated("get_started"),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: CustomColors.mainColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
