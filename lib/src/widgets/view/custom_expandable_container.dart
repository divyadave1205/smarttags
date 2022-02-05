// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';

class CustomExpandableContainer extends StatelessWidget {
  bool expanded;
  final double? collapsedHeight;
  final double? expandedHeight;
  final Widget? child;

  CustomExpandableContainer({
    @required this.child,
    this.collapsedHeight,
    this.expandedHeight,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width - 25;
    return Column(
      children: [
        AnimatedContainer(
          curve: Curves.easeInOut,
          width: screenWidth,
          height: expanded ? expandedHeight : collapsedHeight,
          duration: Duration(milliseconds: 1000),
          child: child,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: ThemeBase().blackColor.withOpacity(0.3),
                blurRadius: 0.1,
              ),
            ],
            color: ThemeBase().whiteColor,
            borderRadius: BorderRadius.circular(7),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        ThemeBase().primaryColor1,
                        ThemeBase().primaryColor2,
                      ]),
                ),
                child: Center(
                  child: Icon(
                    expanded
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up,
                    color: ThemeBase().whiteColor,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
