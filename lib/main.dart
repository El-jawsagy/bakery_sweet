// screen of app to navigator to it
import './views/favorite/favorite_screen.dart';
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
import './providers/favorite/favorit_provider.dart';

//lang switcher
import './lang/applocate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

//reload or restart app
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(Phoenix(
      child: MultiProvider(providers: [
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
  ], child: LanguageDecider())));
}

class LanguageDecider extends StatefulWidget {
  @override
  _LanguageDeciderState createState() => _LanguageDeciderState();
}

class _LanguageDeciderState extends State<LanguageDecider> {
  chooseLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("lang") == null) {
      prefs.setString("lang", "en");
      return Locale(prefs.getString("lang"), '');
    } else {
      return Locale(prefs.getString("lang"), '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: chooseLang(),
      builder: (context, snapshot) {
        return MyApp(snapshot.data);
      },
    );
  }
}

class MyApp extends StatelessWidget {
  final Locale locale;

  MyApp(this.locale);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [
        AppLocale.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      locale: this.locale,
      localeResolutionCallback: (currentLocale, supportedLocales) {
        if (currentLocale != null) {
          for (Locale locale in supportedLocales) {
            if (currentLocale.languageCode == locale.languageCode) {
              return currentLocale;
            }
          }
        }
        return supportedLocales.first;
      },
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
    );
  }
}
