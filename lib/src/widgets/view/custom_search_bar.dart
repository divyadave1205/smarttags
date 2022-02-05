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
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width - 30,
        decoration: BoxDecoration(
          color: ThemeBase().whiteColor,
          boxShadow: [
            BoxShadow(
              color: ThemeBase().blackColor,
            ),
          ],
        ),
        child: Material(
          shadowColor: ThemeBase().whiteColor,
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                // borderSide: BorderSide(
                //   width: 0,
                //   color: ThemeBase().whiteColor.withOpacity(0),
                // ),
              ),
              filled: true,
              fillColor: ThemeBase().whiteColor,
              hintText: "Search",
              hintStyle: FontUtilities.h18(
                fontColor: ThemeBase().backgroundColor,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: ThemeBase().backgroundColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
