// this is widget shared in almost all screen in app

import '../../views/category/category_screen.dart';

import '../product_ceil_widget.dart';
import '../bage_widget.dart';
import '../bottons_and_text_fields_materials.dart';

// screen of app to navigator to it
// import '../../views/product/product_details_screen.dart';
import '../../views/cart/cart_screen.dart';

//theme and colors
import '../../theme/theme.dart';

//providers
import '../../providers/category/catergory_provider.dart';
import '../../providers/products/prdoucts_provider.dart';
import '../../providers/cart/cart_provider.dart';

//pub and core package
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//language
import '../../lang/applocate.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            giveHeightSpace(ctx: context, heightFactor: 0.035),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocale.of(context).getTranslated("deliver"),
                  style: Theme.of(context).textTheme.headline4,
                ),
                Consumer<Cart>(
                  builder: (cartContext, cartProvider, ch) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, CartScreen.routeNamed);
                      },
                      child: Badge(
                        child: ch,
                        value: cartProvider.cartCounterByProduct.toString(),
                        color: CustomColors.mainColor,
                      ),
                    );
                  },
                  child: Icon(Icons.shopping_cart),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  AppLocale.of(context).getTranslated("location"),
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      .copyWith(color: CustomColors.mainColor),
                ),
                Icon(Icons.keyboard_arrow_down)
              ],
            ),
            giveHeightSpace(
              ctx: context,
              heightFactor: 0.025,
            ),
            roundedButtonContainer(
              radiusValue: 10,
              ctx: context,
              widthFactor: 0.85,
              usedColor: CustomColors.greyColor,
              childWidget: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    giveWidthSpace(
                      ctx: context,
                      widthFactor: 0.025,
                    ),
                    Text(
                      AppLocale.of(context).getTranslated("search"),
                      style: Theme.of(context).textTheme.headline3,
                    )
                  ],
                ),
              ),
            ),
            Consumer<Category>(builder: (providerctx, categories, _) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.16,
                child: ListView.builder(
                  itemBuilder: (ctx, index) => _buildCategoryCell(
                      ctx: context, cat: categories.categoryItems[index]),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.categoryItems.length,
                ),
              );
            }),
            Consumer<Product>(builder: (providerctx, products, _) {
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
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCell({BuildContext ctx, Map cat}) {
    return InkWell(
      onTap: () {
        // navigator to Category screen with category id to display all product
        Provider.of<Category>(ctx, listen: false)
            .changeSelectedCategoryId(cat["id"]);
        Navigator.pushNamed(
          ctx,
          CategoryProductScreen.routeNamed,
          // arguments: cat["id"],
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(
          12,
        ),
        child: Container(
          width: MediaQuery.of(ctx).size.width * 0.23,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              7,
            ),
            color: CustomColors.backgroundCatColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                cat["image"],
                width: MediaQuery.of(ctx).size.width * 0.1,
                height: MediaQuery.of(ctx).size.height * 0.08,
                fit: BoxFit.contain,
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  AppLocale.of(ctx).getTranslated("language") == "ar"
                      ? cat["title-ar"]
                      : cat["title-en"],
                  style: Theme.of(ctx)
                      .textTheme
                      .headline5
                      .copyWith(color: CustomColors.mainColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
