// this is widget shared in almost all screen in app
import 'package:bakery_sweet/widgets/appbar_widget.dart';

import '../bottons_and_text_fields_materials.dart';

//theme and colors
import '../../theme/theme.dart';

//pub and core package
import 'package:flutter/material.dart';

//language
import '../../lang/applocate.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          AppBarWidget(
            title: AppLocale.of(context).getTranslated("my_order"),
          ),
          giveHeightSpace(ctx: context, heightFactor: 0.1),
          _buildImage(
            imageCtx: context,
          ),
          _buildCartIsEmpatyTitle(emptyCartCtx: context),
          _buildCartIsEmpatySubtitle(emptyCartCtx: context),
        ],
      ),
    );
  }
}

Widget _buildImage({
  BuildContext imageCtx,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(
        8,
      )),
      child: Image.asset(
        "assets/images/cart.png",
        width: MediaQuery.of(imageCtx).size.width * 0.9,
        height: MediaQuery.of(imageCtx).size.height * 0.25,
        fit: BoxFit.contain,
      ),
    ),
  );
}

Widget _buildCartIsEmpatyTitle({
  BuildContext emptyCartCtx,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocale.of(emptyCartCtx).getTranslated("empty_orders"),
          style: Theme.of(emptyCartCtx).textTheme.headline1.copyWith(
                color: CustomColors.mainColor,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    ),
  );
}

Widget _buildCartIsEmpatySubtitle({
  BuildContext emptyCartCtx,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(emptyCartCtx).size.width * 0.8,
          child: Text(
                      AppLocale.of(emptyCartCtx).getTranslated("subtitle_empty_orders"),

            style: Theme.of(emptyCartCtx).textTheme.headline2.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 24,
                color: CustomColors.subTitleColor),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}
