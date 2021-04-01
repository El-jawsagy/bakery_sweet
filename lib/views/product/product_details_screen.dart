//screen that is navigat to it

// this is widget shared in almost all screen in app
import '../../widgets/bottons_and_text_fields_materials.dart';

//theme and colors
import '../../theme/theme.dart';

//providers
import '../../providers/products/prdoucts_provider.dart';
import '../../providers/cart/cart_provider.dart';
import '../../providers/favorite/favorit_provider.dart';

//pub and core package
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//language
import '../../lang/applocate.dart';

class ProductDetails extends StatelessWidget {
  static final String routeNamed = "productScreen";
  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context).settings.arguments;
    var allProducts = Provider.of<Product>(context);
    Map productOfScreen =
        allProducts.productItems.firstWhere((pro) => pro["id"] == id);
    return Scaffold(
      body: Stack(
        children: [
          //back ground image
          backGroundImage(ctx: context),

          //screen widgets
          Consumer<Cart>(
            builder: (cartCtx, cartProvider, _) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 24),
                child: Column(
                  children: [
                    _appBar(
                      appCtx: context,
                      product: productOfScreen,
                    ),
                    _buildImage(
                      imageCtx: context,
                      product: productOfScreen,
                    ),
                    _buildProductNameandRating(
                      nameCtx: context,
                      product: productOfScreen,
                    ),
                    _buildProductDetails(
                      detailsCtx: context,
                      product: productOfScreen,
                    ),
                    giveHeightSpace(
                      ctx: context,
                      heightFactor: 0.02,
                    ),
                    _buildProductPrice(
                      priceCtx: context,
                      product: productOfScreen,
                    ),
                    giveHeightSpace(
                      ctx: context,
                      heightFactor: 0.25,
                    ),
                    roundedButtonContainer(
                      ctx: context,
                      usedColor: CustomColors.mainColor,
                      widthFactor: 0.8,
                      childWidget: TextButton(
                        onPressed: () {
                          cartProvider.addProductToOrder(
                              productOfScreen["id"], productOfScreen, 1);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Center(
                            child: Text(
                              AppLocale.of(cartCtx)
                                  .getTranslated("add_to_cart"),
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
            },
          ),
        ],
      ),
    );
  }

  _appBar({BuildContext appCtx, Map product}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 28,
          ),
          onPressed: () {
            Navigator.pop(appCtx);
          },
        ),
        Consumer<Favorite>(builder: (_, favoriteProvider, __) {
          return IconButton(
            icon: Icon(
              favoriteProvider.isFavorited(product["id"])
                  ? Icons.favorite
                  : Icons.favorite_border,
              size: 28,
            ),
            onPressed: () =>
                favoriteProvider.toggleProductToFavorite(product["id"]),
          );
        }),
      ],
    );
  }

  _buildImage({BuildContext imageCtx, Map product}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(
          8,
        )),
        child: Image.asset(
          product["image"],
          width: MediaQuery.of(imageCtx).size.width,
          height: MediaQuery.of(imageCtx).size.height * 0.3,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _buildProductNameandRating({BuildContext nameCtx, Map product}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocale.of(nameCtx).getTranslated("language") == "ar"
                ? product["title-ar"]
                : product["title-en"],
            style: Theme.of(nameCtx).textTheme.headline2.copyWith(
                  color: CustomColors.mainColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: CustomColors.mainColor,
              ),
              giveWidthSpace(
                ctx: nameCtx,
                widthFactor: 0.01,
              ),
              Text(
                product["rating"].toString(),
                style: Theme.of(nameCtx).textTheme.headline4.copyWith(
                      color: CustomColors.mainColor,
                      fontWeight: FontWeight.bold,
                    ),
              )
            ],
          )
        ],
      ),
    );
  }

  _buildProductDetails({BuildContext detailsCtx, Map product}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(detailsCtx).size.width * 0.85,
            child: Text(
              AppLocale.of(detailsCtx).getTranslated("language") == "ar"
                  ? product["subtitle-ar"]
                  : product["subtitle-en"],
              style: Theme.of(detailsCtx).textTheme.headline4,
            ),
          ),
        ],
      ),
    );
  }

  _buildProductPrice({BuildContext priceCtx, Map product}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Row(
        children: [
          Text(
            AppLocale.of(priceCtx).getTranslated("price"),
            style: Theme.of(priceCtx).textTheme.headline3.copyWith(
                  color: CustomColors.mainColor,
                ),
          ),
          Text(
            "${product["price"].toString()} \$",
            style: Theme.of(priceCtx).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
