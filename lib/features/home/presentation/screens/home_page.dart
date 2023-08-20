import 'package:excellent/features/home/presentation/screens/featured_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'Tabs/Explore.dart';
import 'Tabs/Home.dart';
import 'Tabs/Insayt.dart';
import 'Tabs/Profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    FeaturedScreen(),
    // Home(),
    Explore(),
    Insayt(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      // appBar: AppBar(
      //   title: Row(
      //     children: [
      //       Icon(
      //         Icons.insights_rounded,
      //         color: Colors.red[700],
      //         size: 40.0,
      //       ),
      //       Text(
      //         'insayt',
      //         style: TextStyle(
      //           fontSize: 30.0,
      //           color: Colors.redAccent[700],
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              // tabBackgroundColor: Colors.grey,
              gap: 8,
              activeColor: const Color(0xffff6600),
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              color: Colors.white,
              tabs: [
                GButton(
                  icon: Icons.cast_for_education,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Explore',
                ),
                GButton(
                  icon: Icons.insights_rounded,
                  text: 'Blogs',
                ),
                GButton(
                  icon: Icons.person_rounded,
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
