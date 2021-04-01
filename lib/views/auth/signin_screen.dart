// this is widget shared in almost all screen in app
import '../../widgets/bottons_and_text_fields_materials.dart';

// screen of app to navigator to it

import './signup_screen.dart';
import '../main_home_screen.dart';

//theme and colors
import '../../theme/theme.dart';

//pub and core package
import 'package:flutter/material.dart';

//language
import 'package:bakery_sweet/lang/applocate.dart';

class SignInScreen extends StatelessWidget {
  static final String routeNamed = "signinScreen";
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //back ground image
          backGroundImage(ctx: context),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //space
                  giveHeightSpace(
                    ctx: context,
                    heightFactor: .1,
                  ),

                  //text displayed to user
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Text(
                      AppLocale.of(context).getTranslated("login_title"),
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                        color: CustomColors.mainColor,
                      ),
                    ),
                  ),

                  //space
                  giveHeightSpace(
                    ctx: context,
                    heightFactor: .06,
                  ),

                  //form container to get data from use
                  _buildFormOfLoginAccount(context),

                  //space
                  giveHeightSpace(
                    ctx: context,
                    heightFactor: .1,
                  ),

                  //button to send user data to create new user in server and get token
                  roundedButtonContainer(
                    ctx: context,
                    usedColor: CustomColors.mainColor,
                    widthFactor: 0.8,
                    childWidget: TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          MainHomeScreen.routeNamed,
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Center(
                          child: Text(
                            AppLocale.of(context).getTranslated("login"),
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

                  //space
                  giveHeightSpace(
                    ctx: context,
                    heightFactor: .3,
                  ),

                  _buildSignUpTextQue(
                    ctx: context,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFormOfLoginAccount(BuildContext context) {
    return Form(
      child: Column(
        children: [
          roundedTextContainer(
            ctx: context,
            usedColor: CustomColors.greyColor,
            widthFactor: 0.85,
            controller: emailController,
            hintTxt: AppLocale.of(context).getTranslated("email"),
          ),
          giveHeightSpace(
            ctx: context,
            heightFactor: .03,
          ),
          roundedTextContainer(
            ctx: context,
            usedColor: CustomColors.greyColor,
            widthFactor: 0.85,
            controller: emailController,
            hintTxt: AppLocale.of(context).getTranslated("password"),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpTextQue({BuildContext ctx}) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(ctx, SignUpScreen.routeNamed);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocale.of(ctx).getTranslated("login_quetion"),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            AppLocale.of(ctx).getTranslated("login_register"),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: CustomColors.mainColor,
            ),
          ),
        ],
      ),
    );
  }
}
