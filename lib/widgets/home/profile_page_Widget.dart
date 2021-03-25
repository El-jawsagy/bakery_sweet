// this is widget shared in almost all screen in app
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
              titleRow: "Profile",
            ),
            DividerWidget(),
            _buildProfileRow(
              profileCtx: context,
              titleRow: "Orders",
              namedScreen: CartScreen.routeNamed,
            ),
            DividerWidget(),
            _buildProfileRow(
              profileCtx: context,
              titleRow: "Favorite",
              namedScreen: FavoriteScreen.routeNamed,
            ),
            DividerWidget(),
            _buildProfileRow(
              profileCtx: context,
              titleRow: "About us",
            ),
            DividerWidget(),
            _buildProfileRow(
                profileCtx: context,
                titleRow: "Support Center",
                namedScreen: SupportScreen.routeNamed),
            DividerWidget(),
            _buildProfileRowWithReplacement(
              profileCtx: context,
              titleRow: "Log out",
              namedScreen: SignInScreen.routeNamed,
            ),
            DividerWidget(),
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
