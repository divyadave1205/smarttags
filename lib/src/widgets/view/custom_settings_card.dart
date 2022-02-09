// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:smarttags/utilities/font/font_utilities.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';

class CustomSettingsCard extends StatefulWidget {
  final String? settingName;
  final Widget? settingIcon;
  const CustomSettingsCard({Key? key, this.settingName, this.settingIcon})
      : super(key: key);

  @override
  _CustomSettingsCardState createState() => _CustomSettingsCardState();
}

class _CustomSettingsCardState extends State<CustomSettingsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        height: 55,
        width: MediaQuery.of(context).size.width - 30,
        child: Card(
          elevation: 3,
          shadowColor: ThemeBase().blackColor.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                widget.settingIcon!,
                SizedBox(
                  width: 10,
                ),
                Text(
                  widget.settingName ?? "",
                  style: FontUtilities.h20(
                    fontColor: ThemeBase().mainTextColor,
                    fontWeight: FWT.regular,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
