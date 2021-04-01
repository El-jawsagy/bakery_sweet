// this is widget shared in almost all screen in app
import 'package:bakery_sweet/theme/theme.dart';

import '../../widgets/appbar_widget.dart';
import '../../widgets/bottons_and_text_fields_materials.dart';
import '../../widgets/product_ceil_widget.dart';

// providers to fetch
import '../../providers/favorite/favorit_provider.dart';

//pub and core package
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//language
import '../../lang/applocate.dart';

class FavoriteScreen extends StatelessWidget {
  static final String routeNamed = "favoriteProductScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //back ground image
          backGroundImage(ctx: context),

          //Favorite product builder with Provider
          Consumer<Favorite>(
            builder: (cartCtx, favoriteProvider, _) {
              return Column(
                children: [
                  AppBarWidget(
                    title: AppLocale.of(context).getTranslated("my_favorite"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Expanded(
                      child: ListView.builder(
                        itemBuilder: (ctx, index) => Dismissible(
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
                          key: ValueKey(
                              favoriteProvider.favoritItems[index]["id"]),
                          onDismissed: (diraction) {
                            favoriteProvider.toggleProductToFavorite(
                                favoriteProvider.favoritItems[index]["id"]);
                          },
                          child: ProductCeil(
                              product: favoriteProvider.favoritItems[index]),
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: favoriteProvider.favoritItems.length,
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
