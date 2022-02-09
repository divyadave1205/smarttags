// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smarttags/src/widgets/view/custom_appbar.dart';
import 'package:smarttags/src/widgets/view/custom_settings_card.dart';
import 'package:smarttags/utilities/asset/asset_utilities.dart';
import 'package:smarttags/utilities/font/font_utilities.dart';
import 'package:smarttags/utilities/route/route_utilities.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeBase().whiteColor,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 60),
        child: CustomAppbar(
          pageName: "Settings",
          onTap: () {
            Navigator.of(context).popAndPushNamed(RouteUtilities.homeScreen);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 5),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 55,
                  width: 55,
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
                  child:
                      Center(child: Image.asset(AssetUtilities.smallApplogo)),
                ),
              ),
              Text(
                'Smartags',
                style: FontUtilities.h20(
                  fontColor: ThemeBase().mainTextColor,
                ),
              )
            ],
          ),
          CustomSettingsCard(
            settingIcon: Icon(Icons.lock),
            settingName: 'Privacy Policy',
          ),
          CustomSettingsCard(
            settingIcon: Icon(Icons.info_outline),
            settingName: 'About Us',
          ),
          CustomSettingsCard(
            settingIcon: SizedBox(
              height: 20,
              width: 20,
              child: Image.asset(AssetUtilities.callIcon),
            ),
            settingName: 'Contact Us',
          ),
          CustomSettingsCard(
            settingIcon: Icon(Icons.star_border),
            settingName: 'Rate Us',
          ),
        ],
      ),
    );
  }
}
