// this is widget shared in almost all screen in app
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/divider.dart';
import '../../widgets/bottons_and_text_fields_materials.dart';

//theme and colors
import '../../theme/theme.dart';

// screen of app to navigator to it
import '../../views/auth/signin_screen.dart';
import '../../views/cart/cart_screen.dart';
import '../../views/support_screen.dart';
import '../../views/favorite/favorite_screen.dart';

//pub and core package
import 'package:flutter/material.dart';

//language
import '../../lang/applocate.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 48.0,
          left: 8,
          right: 8,
        ),
        child: Column(
          children: [
            _buildProfileImageDetails(
              profileCtx: context,
            ),
            giveHeightSpace(
              ctx: context,
              heightFactor: .05,
            ),
            _buildProfileRow(
              profileCtx: context,
              titleRow: AppLocale.of(context).getTranslated("profile"),
            ),
            DividerWidget(),
            _buildProfileRow(
              profileCtx: context,
              titleRow: AppLocale.of(context).getTranslated("order"),
              namedScreen: CartScreen.routeNamed,
            ),
            DividerWidget(),
            _buildProfileRow(
              profileCtx: context,
              titleRow: AppLocale.of(context).getTranslated("favorite"),
              namedScreen: FavoriteScreen.routeNamed,
            ),
            DividerWidget(),
            _buildProfileRow(
              profileCtx: context,
              titleRow: AppLocale.of(context).getTranslated("about"),
            ),
            DividerWidget(),
            _buildProfileRow(
                profileCtx: context,
                titleRow: AppLocale.of(context).getTranslated("support"),
                namedScreen: SupportScreen.routeNamed),
            DividerWidget(),
            _buildProfileRowWithReplacement(
              profileCtx: context,
              titleRow: AppLocale.of(context).getTranslated("logout"),
              namedScreen: SignInScreen.routeNamed,
            ),
            DividerWidget(),
            InkWell(
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                String lang = prefs.getString("lang");
                if (lang == 'ar') {
                  setLang('en');
                  Phoenix.rebirth(context);
                } else {
                  setLang('ar');
                  Phoenix.rebirth(context);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.translate,
                        color: CustomColors.titleBlackColor,
                      ),
                      giveWidthSpace(ctx: context, widthFactor: 0.01),
                      Text(
                        AppLocale.of(context).getTranslated("language") == "ar"
                            ? "English"
                            : "العربية",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImageDetails({
    BuildContext profileCtx,
  }) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          child: Image.asset(
            "assets/images/person.png",
            width: MediaQuery.of(profileCtx).size.width * 0.25,
            height: MediaQuery.of(profileCtx).size.height * 0.1,
          ),
        ),
        giveWidthSpace(
          ctx: profileCtx,
          widthFactor: .01,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "mahmoud ragab",
              style: Theme.of(profileCtx)
                  .textTheme
                  .headline3
                  .copyWith(color: CustomColors.mainColor),
            ),
            giveHeightSpace(
              ctx: profileCtx,
              heightFactor: .005,
            ),
            Text(
              "mahmoudragab0809@gmail.com",
              style: Theme.of(profileCtx).textTheme.headline5,
            ),
          ],
        )
      ],
    );
  }

  Widget _buildProfileRow(
      {BuildContext profileCtx, String namedScreen, String titleRow}) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(profileCtx, namedScreen);
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: MediaQuery.of(profileCtx).size.width * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titleRow,
                style: Theme.of(profileCtx).textTheme.headline3,
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

  Widget _buildProfileRowWithReplacement(
      {BuildContext profileCtx, String namedScreen, String titleRow}) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(profileCtx, namedScreen);
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: MediaQuery.of(profileCtx).size.width * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titleRow,
                style: Theme.of(profileCtx).textTheme.headline3,
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

setLang(String lang) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("lang", lang);
}
