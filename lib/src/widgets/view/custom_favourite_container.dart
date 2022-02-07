import 'package:flutter/material.dart';
import 'package:smarttags/utilities/font/font_utilities.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';

class CustomFavouriteContainer extends StatelessWidget {
  const CustomFavouriteContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: MediaQuery.of(context).size.width - 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ThemeBase().whiteColor,
        boxShadow: [
          BoxShadow(
            color: ThemeBase().blackColor.withOpacity(0.2),
            blurRadius: 3,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "Lifestyle",
            style: FontUtilities.h20(
              fontColor: ThemeBase().backgroundColor,
            ),
          )
        ],
      ),
    );
  }
}
