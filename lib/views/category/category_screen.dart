//screen that is navigat to it

// this is widget shared in almost all screen in app

import '../../widgets/product_ceil_widget.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/bottons_and_text_fields_materials.dart';

//theme and colors
// import '../../theme/theme.dart';

//providers
// import '../../providers/cart/cart_provider.dart';
import '../../providers/category/catergory_provider.dart';

//pub and core package
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//language
import '../../lang/applocate.dart';

class CategoryProductScreen extends StatelessWidget {
  static final String routeNamed = "categoryProductScreen";

  const CategoryProductScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String id = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Stack(
        children: [
          //back ground image
          backGroundImage(ctx: context),

          //category product builder with Provider
          Consumer<Category>(
            builder: (cartCtx, cartProvider, _) {
              return Column(
                children: [
                  AppBarWidget(
                    title:
                        AppLocale.of(context).getTranslated("language") == "ar"
                            ? cartProvider.selectedCategory["title-ar"]
                            : cartProvider.selectedCategory["title-en"],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (ctx, index) => ProductCeil(
                          product: cartProvider.categoryProductItems[index]),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: cartProvider.categoryProductItems.length,
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
