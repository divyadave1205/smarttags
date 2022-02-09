// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarttags/utilities/asset/asset_utilities.dart';
import 'package:smarttags/utilities/route/route_utilities.dart';
import 'package:smarttags/utilities/settings/local_cache.dart';
import 'package:smarttags/utilities/settings/variable_utilities.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;
  @override
  void initState() {
    initializeSettings();
    super.initState();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      timer.cancel();

      String firstTutorialScreen = RouteUtilities.tutorialScreen;

      Navigator.pushReplacementNamed(context, firstTutorialScreen,
          arguments: {});
    });
  }

  Future<void> initializeSettings() async {
    VariableUtilities.prefs = await SharedPreferences.getInstance();

    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        ThemeBase().primaryColor1,
        ThemeBase().primaryColor2,
      ],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
    return Scaffold(
      backgroundColor: ThemeBase().backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 400,
            left: -210,
            child: Container(
              height: 499,
              width: 486,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: ThemeBase().backgroundColor.withOpacity(0.02),
                    blurStyle: BlurStyle.inner,
                    blurRadius: 20,
                    offset: Offset(5, 5),
                  ),
                  BoxShadow(
                    color: ThemeBase().whiteColor.withOpacity(0.02),
                    blurStyle: BlurStyle.inner,
                    blurRadius: 20,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 400,
            left: 320,
            child: Container(
              height: 209,
              width: 204,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: ThemeBase().primaryColor1.withOpacity(0.02),
                    blurStyle: BlurStyle.inner,
                    blurRadius: 20,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -150,
            left: 155,
            child: Container(
              height: 452,
              width: 440,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: ThemeBase().whiteColor.withOpacity(0.02),
                    blurStyle: BlurStyle.inner,
                    blurRadius: 20,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 130,
            left: -131,
            child: Container(
              height: 209,
              width: 204,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: ThemeBase().primaryColor1.withOpacity(0.02),
                    blurStyle: BlurStyle.inner,
                    blurRadius: 20,
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset(AssetUtilities.applicationLogo),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Smartags",
                    style: TextStyle(
                      fontSize: 45,
                      foreground: Paint()..shader = linearGradient,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
