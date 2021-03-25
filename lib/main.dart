// screen of app to navigator to it
import 'package:bakery_sweet/providers/favorite/favorit_provider.dart';
import 'package:bakery_sweet/views/favorite/favorite_screen.dart';

import './views/category/category_screen.dart';
import './views/support_screen.dart';
import './views/cart/cart_screen.dart';
import './views/main_home_screen.dart';
import './views/product/product_details_screen.dart';
import './views/auth/forget_pass.dart';
import './views/auth/signin_screen.dart';
import './views/auth/signup_screen.dart';
import './views/onbarding_screen.dart';
import './views/welcom_screen.dart';

//theme and colors
import './theme/theme.dart';

//pub and core package
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

//providers
import './providers/category/catergory_provider.dart';
import './providers/products/prdoucts_provider.dart';
import './providers/cart/cart_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Product>(
          create: (ctx) => Product(),
        ),
        ChangeNotifierProvider<Category>(
          create: (ctx) => Category(),
        ),
        ChangeNotifierProvider<Cart>(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider<Favorite>(
          create: (ctx) => Favorite(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: lightTheme,
        darkTheme: lightTheme,
        home: WelcomScreen(),
        routes: {
          OnBoardingScreen.routeNamed: (ctx) => OnBoardingScreen(),
          SignUpScreen.routeNamed: (ctx) => SignUpScreen(),
          SignInScreen.routeNamed: (ctx) => SignInScreen(),
          ForgetPassScreen.routeNamed: (ctx) => ForgetPassScreen(),
          MainHomeScreen.routeNamed: (ctx) => MainHomeScreen(),
          ProductDetails.routeNamed: (ctx) => ProductDetails(),
          CartScreen.routeNamed: (ctx) => CartScreen(),
          SupportScreen.routeNamed: (ctx) => SupportScreen(),
          CategoryProductScreen.routeNamed: (ctx) => CategoryProductScreen(),
          FavoriteScreen.routeNamed: (ctx) => FavoriteScreen(),
        },
      ),
    );
  }
}
