// this is widget shared in almost all screen in app
import '../widgets/bottons_and_text_fields_materials.dart';

// widgets of screen to display on it
import '../widgets/home/home_Page_widget.dart';
import '../widgets/home/offer_page_widget.dart';
import '../widgets/home/profile_page_Widget.dart';

//pub and core package
import 'package:flutter/material.dart';

class MainHomeScreen extends StatefulWidget {
  static final String routeNamed = "mainScreen";

  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int pos;
  @override
  void initState() {
    super.initState();
    pos = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //back ground image
          backGroundImage(ctx: context),

          //indecator to switch between multi screen
          pos == 0 ? HomePage() : (pos == 1 ? OfferPage() : ProfilePage()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: pos,
        onTap: (newIndex) {
          setState(() {
            pos = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_fire_department),
            label: 'Offer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
