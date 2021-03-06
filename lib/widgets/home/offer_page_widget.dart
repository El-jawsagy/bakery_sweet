// this is widget shared in almost all screen in app
import '../product_ceil_widget.dart';

//theme and colors
import '../../theme/theme.dart';

//providers
import '../../providers/products/prdoucts_provider.dart';

//pub and core package
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//language
import '../../lang/applocate.dart';

class OfferPage extends StatelessWidget {
  const OfferPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildOfferIntro(context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Consumer<Product>(builder: (providerctx, products, _) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, index) =>
                      ProductCeil(product: products.productItems[index]),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: products.productItems.length,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildOfferIntro(BuildContext ctx) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      width: MediaQuery.of(ctx).size.width,
      height: MediaQuery.of(ctx).size.height * .27,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          CustomColors.mainColor,
          CustomColors.mainColor.withOpacity(
            0.85,
          )
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: Stack(
        children: [
          Align(
            alignment: AppLocale.of(ctx).getTranslated("language") == "ar"
                ? Alignment.bottomLeft
                : Alignment.bottomRight,
            child: Image.asset(
              AppLocale.of(ctx).getTranslated("language") == "ar"
                  ? "assets/images/offer_bike_ar.png"
                  : "assets/images/offer_bike_en.png",
              width: MediaQuery.of(ctx).size.width * 0.45,
              height: MediaQuery.of(ctx).size.height * 0.2,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocale.of(ctx).getTranslated("last_offer"),
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.whiteColor,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(ctx).size.width * 0.55,
                child: Text(
                  AppLocale.of(ctx).getTranslated("subtitle_last_offer"),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: CustomColors.whiteColor,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
