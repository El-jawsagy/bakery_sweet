// this is widget shared in almost all screen in app

import '../widgets/appbar_widget.dart';
import '../widgets/divider.dart';
import '../widgets/bottons_and_text_fields_materials.dart';

//theme and colors
import '../theme/theme.dart';

// screen of app to navigator to it
import 'package:bakery_sweet/views/main_home_screen.dart';

//pub and core package
import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  static final String routeNamed = "supportScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //back ground image
          backGroundImage(ctx: context),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                AppBarWidget(
                  title: "Support",
                ),
                _buildCardOfOurSupporters(
                  supportCtx: context,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Potential questions to ask",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ],
                  ),
                ),
                _buildSupportRow(
                  supportCtx: context,
                  titleRow: "My order didn't deliver?",
                ),
                DividerWidget(),
                _buildSupportRow(
                  supportCtx: context,
                  titleRow: "My order came with missing an item?",
                ),
                DividerWidget(),
                _buildSupportRow(
                  supportCtx: context,
                  titleRow: "Change my phone number?",
                ),
                DividerWidget(),
                _buildSupportRow(
                  supportCtx: context,
                  titleRow: "Change my delivery address?",
                ),
                DividerWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildCardOfOurSupporters({BuildContext supportCtx}) {
    return Card(
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(supportCtx).size.width * 0.45,
              child: Column(
                children: [
                  Text(
                    "Live Chat With \n Our Supports",
                    style: Theme.of(supportCtx).textTheme.headline2.copyWith(
                        color: CustomColors.mainColor,
                        fontWeight: FontWeight.bold),
                  ),
                  giveHeightSpace(ctx: supportCtx, heightFactor: 0.03),
                  roundedButtonContainer(
                    ctx: supportCtx,
                    usedColor: CustomColors.mainColor,
                    widthFactor: 0.4,
                    heightFactor: 0.05,
                    childWidget: TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          supportCtx,
                          MainHomeScreen.routeNamed,
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(supportCtx).size.width * 0.45,
                        child: Center(
                          child: Text(
                            "Chat",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
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
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Image.asset(
                "assets/images/support_image.png",
                width: MediaQuery.of(supportCtx).size.width * .3,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSupportRow(
      {BuildContext supportCtx, String namedScreen, String titleRow}) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(supportCtx, namedScreen);
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: MediaQuery.of(supportCtx).size.width * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(supportCtx).size.width * 0.7,
                child: Text(
                  titleRow,
                  style: Theme.of(supportCtx).textTheme.headline3,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: CustomColors.titleBlackColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
