// this is widget shared in almost all screen in app
import '../widgets/bottons_and_text_fields_materials.dart';

//theme and colors
import '../theme/theme.dart';

//pub and core package
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeNamed = "signUpScreen";
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/background_image.png",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.75,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 28,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  giveHeightSpace(
                    ctx: context,
                    heightFactor: .03,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Text(
                      "Creat Your \n Account",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                        color: CustomColors.mainColor,
                      ),
                    ),
                  ),
                  giveHeightSpace(
                    ctx: context,
                    heightFactor: .06,
                  ),
                  _buildFormOfCreateAccount(context),
                  giveHeightSpace(
                    ctx: context,
                    heightFactor: .1,
                  ),
                  roundedButtonContainer(
                    ctx: context,
                    usedColor: CustomColors.mainColor,
                    widthFactor: 0.8,
                    childWidget: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignUpScreen.routeNamed);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Center(
                          child: Text(
                            "Sign Up",
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFormOfCreateAccount(BuildContext context) {
    return Form(
      child: Column(
        children: [
          roundedTextContainer(
            ctx: context,
            usedColor: CustomColors.greyColor,
            widthFactor: 0.85,
            controller: nameController,
            hintTxt: "User Name",
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
            hintTxt: "Email",
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
            hintTxt: "Phone",
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
            hintTxt: "Password",
          ),
        ],
      ),
    );
  }
}
