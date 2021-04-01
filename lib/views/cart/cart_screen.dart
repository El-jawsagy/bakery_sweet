// widgets of screen to display on it
import '../../widgets/cart/empty_cart_widget.dart';
import '../../widgets/cart/products_cart_widget.dart';

// this is widget shared in almost all screen in app
import '../../widgets/bottons_and_text_fields_materials.dart';

//theme and colors
// import '../../theme/theme.dart';

//providers
import '../../providers/cart/cart_provider.dart';

//pub and core package
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static final String routeNamed = "orderScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //back ground image
          backGroundImage(ctx: context),

          //screen widgets
          Consumer<Cart>(
            builder: (cartContex, cartProvider, _) {
              return cartProvider.cartItems.length > 0
                  ? ProductsCartWidget(
                      productCartItem: cartProvider.cartItems,
                      totalAmount: cartProvider.cartAmount,
                    )
                  : EmptyCartWidget();
            },
          ),
        ],
      ),
    );
  }
}
