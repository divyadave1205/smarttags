import 'package:flutter/material.dart';
import 'package:smarttags/utilities/font/font_utilities.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';

class CustomTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? buttonName;
  const CustomTextButton({Key? key, this.onPressed, this.buttonName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        buttonName ?? "",
        style: FontUtilities.h18(
          fontColor: ThemeBase().tutorialTextColor2,
          fontWeight: FWT.regular,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
