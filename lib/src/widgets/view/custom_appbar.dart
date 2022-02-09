import 'package:flutter/material.dart';
import 'package:smarttags/utilities/font/font_utilities.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';

class CustomAppbar extends StatelessWidget {
  final String? pageName;
  final void Function()? onTap;
  const CustomAppbar({Key? key, this.pageName, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 60,
      leading: GestureDetector(
        child: Icon(Icons.arrow_back),
        onTap: onTap,
      ),
      leadingWidth: 50,
      backgroundColor: ThemeBase().backgroundColor,
      title: Text(
        pageName ?? "",
        style: FontUtilities.h22(
          fontColor: ThemeBase().whiteColor,
          fontWeight: FWT.semiBold,
        ),
      ),
    );
  }
}
