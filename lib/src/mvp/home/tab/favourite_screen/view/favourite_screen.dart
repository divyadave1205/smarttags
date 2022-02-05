// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smarttags/src/widgets/view/Custom_search_bar.dart';
import 'package:smarttags/src/widgets/view/custom_favourite_container.dart';
import 'package:smarttags/utilities/asset/asset_utilities.dart';
import 'package:smarttags/utilities/font/font_utilities.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeBase().whiteColor,
      appBar: AppBar(
        toolbarHeight: 60,
        leading: Icon(Icons.arrow_back),
        leadingWidth: 50,
        backgroundColor: ThemeBase().backgroundColor,
        title: Text(
          "Favourites",
          style: FontUtilities.h22(
            fontColor: ThemeBase().whiteColor,
            fontWeight: FWT.semiBold,
          ),
        ),
      ),
      body: Column(
        children: [
          CustomSearchBar(),
          CustomFavouriteContainer(),
        ],
      ),
      //  Center(
      //   child: Column(
      //     children: [
      //       SizedBox(height: 100),
      //       Image.asset(
      //         AssetUtilities.favourtieScreenVector,
      //       ),
      //       Text(
      //         "Here you will find your favourite collections",
      //         style: FontUtilities.h16(
      //           fontColor: ThemeBase().mainTextColor,
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
