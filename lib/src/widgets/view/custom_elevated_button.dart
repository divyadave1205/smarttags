import 'package:flutter/material.dart';
import 'package:smarttags/utilities/font/font_utilities.dart';
import 'package:smarttags/utilities/route/route_utilities.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';

typedef OnPageChangeCallBack = void Function(int);

class CustomElevatedButton extends StatefulWidget {
  final double? width;
  final double? height;
  final void Function()? onTap;
  final Widget? child;

  const CustomElevatedButton({
    Key? key,
    this.onTap,
    this.child,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  int? selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
        height: widget.height,
        width: widget.width,
        child: widget.child,
      ),
    );
  }
}
