// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smarttags/utilities/font/font_utilities.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadowColor: ThemeBase().blackColor.withOpacity(0.3),
          child: TextFormField(
            decoration: InputDecoration(
              fillColor: ThemeBase().whiteColor,
              prefixIcon: Icon(
                Icons.search,
                color: ThemeBase().backgroundColor,
              ),
              hintText: "Search",
              hintStyle: FontUtilities.h18(
                fontColor: ThemeBase().backgroundColor,
              ),
              filled: true,
            ),
          ),
        )
        
        );
  }
}
