// this is widget shared in almost all screen in app=
import 'package:bakery_sweet/providers/cart/cart_provider.dart';
import 'package:bakery_sweet/widgets/appbar_widget.dart';
import 'package:provider/provider.dart';

import '../bottons_and_text_fields_materials.dart';

// screen of app to navigator to it
import '../../views/product/product_details_screen.dart';
import '../../views/main_home_screen.dart';

//theme and colors
import '../../theme/theme.dart';

//pub and core package
import 'package:flutter/material.dart';

//language
import '../../lang/applocate.dart';

class ProductsCartWidget extends StatelessWidget {
  final Map productCartItem;
  final double totalAmount;
  ProductsCartWidget({this.productCartItem, this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          AppBarWidget(
            title: AppLocale.of(context).getTranslated("my_order"),
          ),
          Expanded(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, index) => _buildProductCell(
                  ctx: context, prod: productCartItem.values.toList()[index]),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: productCartItem.length,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocale.of(context).getTranslated("total"),
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .copyWith(color: CustomColors.titleBlackColor),
              ),
              Chip(
                label: Text(
                  "\$ $totalAmount",
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: CustomColors.whiteColor),
                ),
                backgroundColor: Theme.of(context).primaryColor,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocale.of(context).getTranslated("delivery"),
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .copyWith(color: CustomColors.titleBlackColor),
              ),
              Chip(
                label: Text(
                  "\$ 6",
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: CustomColors.whiteColor),
                ),
                backgroundColor: Theme.of(context).primaryColor,
              )
            ],
          ),
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
                    AppLocale.of(context).getTranslated("check_out"),
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
    );
  }

  _buildProductCell({BuildContext ctx, CartItem prod}) {
    return Dismissible(
      key: ValueKey(
        prod.product["id"],
      ),
      background: Container(
        decoration: BoxDecoration(
          color: CustomColors.mainColor.withOpacity(0.8),
          borderRadius: BorderRadius.all(
            Radius.circular(
              7,
            ),
          ),
        ),
        child: Icon(
          Icons.delete,
          size: 32,
          color: CustomColors.whiteColor,
        ),
      ),
      onDismissed: (val) {
        var cartProv = Provider.of<Cart>(ctx, listen: false);
        cartProv.removeProductToOrder(prod.product["id"]);
      },
      child: InkWell(
        onTap: () {
          // navigator to product screen witth product id
          Navigator.pushNamed(ctx, ProductDetails.routeNamed,
              arguments: prod.product["id"]);
        },
        child: Padding(
          padding: const EdgeInsets.only(
            top: 6,
          ),
          child: Container(
            width: MediaQuery.of(ctx).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                7,
              ),
              color: CustomColors.backgroundCatColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(7),
                      bottomLeft: Radius.circular(7),
                    ),
                    child: Image.asset(
                      prod.product["image"],
                      width: MediaQuery.of(ctx).size.width * 0.34,
                      height: MediaQuery.of(ctx).size.width * 0.34,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Spacer(),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            AppLocale.of(ctx).getTranslated("language") == "ar"
                                ? prod.product["title-ar"]
                                : prod.product["title-en"],
                            style: Theme.of(ctx).textTheme.headline4,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            width: MediaQuery.of(ctx).size.width * 0.3,
                            child: Text(
                              AppLocale.of(ctx).getTranslated("language") ==
                                      "ar"
                                  ? prod.product["subtitle-ar"]
                                  : prod.product["subtitle-en"],
                              maxLines: 3,
                              style: Theme.of(ctx).textTheme.headline6,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Icon(
                            Icons.star,
                            size: 20,
                            color: CustomColors.mainColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            prod.product["rating"].toString(),
                            style: Theme.of(ctx).textTheme.headline4.copyWith(
                                  color: CustomColors.mainColor,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text(
                            AppLocale.of(ctx).getTranslated("quentity"),
                            style: Theme.of(ctx).textTheme.headline4.copyWith(
                                  color: CustomColors.mainColor,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            prod.quentity.toString(),
                            style: Theme.of(ctx).textTheme.headline4.copyWith(
                                  color: CustomColors.mainColor,
                                ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
