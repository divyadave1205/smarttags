import 'package:flutter/material.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';

class CustomIcon extends StatelessWidget {
  final double? width;
  final String? url;
  final void Function()? onTap;
  const CustomIcon({Key? key, this.width, this.url, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
          borderRadius: BorderRadius.circular(10),
        ),
        height: 45,
        width: width,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: ThemeBase().whiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(url ?? ""),
            height: 42,
            width: width! - 3,
          ),
        ),
      ),
    );
  }
}
