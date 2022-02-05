// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smarttags/src/mvp/home/tab/favourite_screen/view/favourite_screen.dart';
import 'package:smarttags/src/mvp/home/tab/home_screen/home_screen.dart';
import 'package:smarttags/src/mvp/home/tab/settings_screen/view/settings.dart';
import 'package:smarttags/src/mvp/home/tab/trending_screen/view/trending_screen.dart';
import 'package:smarttags/src/widgets/view/custom_Bottom_navigation_bar.dart';
import 'package:smarttags/utilities/font/font_utilities.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';

class Home extends StatelessWidget {
  final int? index;
  final PageController myPage = PageController();
  Home({Key? key, this.index = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_literals_to_create_immutables
      body: PageView(
        scrollDirection: Axis.horizontal,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          HomeScreen(),
          TrendingScreen(),
          FavouriteScreen(),
          SettingsScreen(),
        ],
        controller: myPage,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onPageChange: (int index) {
          myPage.jumpToPage(index);
        },
      ),
      floatingActionButton: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ThemeBase().primaryColor1,
              ThemeBase().primaryColor2,
            ],
          ),
        ),
        child: Center(
          child: Text(
            "0#",
            style: FontUtilities.h18(
              fontColor: ThemeBase().whiteColor,
              fontWeight: FWT.semiBold,
            ),
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
