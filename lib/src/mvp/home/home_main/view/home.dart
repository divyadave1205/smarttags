// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarttags/src/mvp/home/tab/favourite_screen/view/favourite_screen.dart';
import 'package:smarttags/src/mvp/home/tab/home_screen/captions/life/view/life_captions.dart';
import 'package:smarttags/src/mvp/home/tab/home_screen/hashtags/food/view/food.dart';
import 'package:smarttags/src/mvp/home/tab/home_screen/home_screen.dart';
import 'package:smarttags/src/mvp/home/tab/settings_screen/view/settings.dart';
import 'package:smarttags/src/mvp/home/tab/trending_screen/view/trending_screen.dart';
import 'package:smarttags/src/widgets/view/bottomsheet/provider/bottom_sheet_provider.dart';
import 'package:smarttags/src/widgets/view/custom_Bottom_navigation_bar.dart';
import 'package:smarttags/utilities/font/font_utilities.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';

class Home extends StatelessWidget {
  final int? index;
  final PageController myPage = PageController();
  Home({Key? key, this.index = 0}) : super(key: key);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // ignore: prefer_const_literals_to_create_immutables
      body: PageView(
        scrollDirection: Axis.horizontal,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          HomeScreen(),
          TrendingScreen(),
          FavouriteScreen(),
          SettingsScreen(),
          Food(),
          LifeCaptions()
        ],
        controller: myPage,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onPageChange: (int index) {
          myPage.jumpToPage(index);
        },
      ),
      floatingActionButton: Container(
        height: 50,
        width: 50,
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
        child: Consumer(
          builder: (context, BottomSheetProvider value, child) {
            return Center(
              child: Text(
                value.count.toString() + "#",
                style: FontUtilities.h18(
                  fontColor: ThemeBase().whiteColor,
                  fontWeight: FWT.semiBold,
                ),
              ),
            );
          },
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
