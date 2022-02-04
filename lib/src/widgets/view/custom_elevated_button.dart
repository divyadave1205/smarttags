import 'package:flutter/material.dart';
import 'package:smarttags/utilities/font/font_utilities.dart';
import 'package:smarttags/utilities/route/route_utilities.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';

typedef OnPageChangeCallBack = void Function(int);

class CustomElevatedButton extends StatefulWidget {
  final void Function()? onTap;

  const CustomElevatedButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  int? selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                RouteUtilities.homeScreen,
              );
            },
            child: Text(
              'Skip',
              style: FontUtilities.h18(
                fontColor: ThemeBase().tutorialTextColor2,
                fontWeight: FWT.regular,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: widget.onTap,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ThemeBase().primaryColor2,
                  ThemeBase().primaryColor1,
                ],
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            height: 50,
            width: 55,
            child: Icon(
              Icons.navigate_next,
              color: ThemeBase().whiteColor,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
