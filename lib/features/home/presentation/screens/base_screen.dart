import 'package:excellent/features/constants/color.dart';
import 'package:excellent/features/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:excellent/features/home/presentation/screens/featured_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const _widgetsOption = <Widget>[
    FeaturedScreen(),
    Text(
      'My Courses',
      style: optionStyle,
    ),
    Text(
      'Search',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetsOption.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.5),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
            child: GNav(
              rippleColor: Colors.grey[800]!,
              hoverColor: Colors.grey[100]!,
              gap: 2,
              activeColor: kPrimaryLight,
              duration: Duration(microseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              iconSize: kBottomNavigationBarItemSize,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              style: GnavStyle.google,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.play_arrow,
                  text: 'My Courses',
                ),
                GButton(
                  icon: Icons.list_alt_outlined,
                  text: 'WishList',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                )
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
