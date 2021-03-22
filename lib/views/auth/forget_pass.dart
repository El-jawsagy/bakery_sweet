// this is widget shared in almost all screen in app
import '../../widgets/bottons_and_text_fields_materials.dart';

//theme and colors
import '../../theme/theme.dart';

//pub and core package
import 'package:flutter/material.dart';

class ForgetPassScreen extends StatelessWidget {
  static const String routeNamed = "forgetPassScreen";
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
                  //back button to back previous screen
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

                  //space
                  giveHeightSpace(
                    ctx: context,
                    heightFactor: .03,
                  ),

                  //text displayed to user
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Text(
                      "Forgot Password",
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
                  _buildFormOfForgetPass(context),

                  //space
                  giveHeightSpace(
                    ctx: context,
                    heightFactor: .1,
                  ),

                  //button to send user data to server and check user and send number and enter it to confirm him
                  roundedButtonContainer(
                    ctx: context,
                    usedColor: CustomColors.mainColor,
                    widthFactor: 0.8,
                    childWidget: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, ForgetPassScreen.routeNamed);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Center(
                          child: Text(
                            "Next",
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

  Widget _buildFormOfForgetPass(BuildContext context) {
    return Form(
      child: Column(
        children: [
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
        ],
      ),
    );
  }
}
