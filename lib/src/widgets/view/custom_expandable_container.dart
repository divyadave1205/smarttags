// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';

class CustomExpandableContainer extends StatefulWidget {
  bool expanded;
  final double? collapsedHeight;
  final double? expandedHeight;
  final Widget? child;
  final void Function()? onTap;

  CustomExpandableContainer({
    @required this.child,
    this.collapsedHeight,
    this.expandedHeight,
    this.expanded = false,
    this.onTap,
  });

  @override
  State<CustomExpandableContainer> createState() =>
      _CustomExpandableContainerState();
}

class _CustomExpandableContainerState extends State<CustomExpandableContainer> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width - 25;
    return Column(
      children: [
        Card(
          elevation: 3,
          shadowColor: ThemeBase().whiteColor.withOpacity(0.7),
          child: AnimatedContainer(
            curve: Curves.ease,
            width: screenWidth,
            height: widget.expanded
                ? widget.expandedHeight
                : widget.collapsedHeight,
            duration: Duration(milliseconds: 500),
            child: widget.child,
            decoration: BoxDecoration(
              color: ThemeBase().whiteColor,
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        ),
        GestureDetector(
          onTap: widget.onTap,
          child: Container(
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
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.expanded = !widget.expanded;
                  });
                },
                child: Icon(
                  widget.expanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: ThemeBase().whiteColor,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
