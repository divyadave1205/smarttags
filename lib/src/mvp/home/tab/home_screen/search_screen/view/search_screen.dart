// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:smarttags/src/widgets/view/custom_appbar.dart';
import 'package:smarttags/src/widgets/view/custom_search_bar.dart';
import 'package:smarttags/utilities/font/font_utilities.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 60),
        child: CustomAppbar(
          pageName: "Search",
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: ThemeBase().whiteColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomSearchBar(),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 22.0),
                child: Text(
                  'Search History',
                  style: FontUtilities.h16(
                    fontColor: ThemeBase().mainTextColor,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
