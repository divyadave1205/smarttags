import 'package:flutter/material.dart';
import 'package:smarttags/src/mvp/home/home_main/view/home.dart';
import 'package:smarttags/src/mvp/splash/view/splash_screen.dart';
import 'package:smarttags/src/mvp/tutorial/view/tutorial_screen.dart';

class RouteUtilities {
  static const String route = '/';
  static const String splashScreen = '/splashScreen';
  static const String firstTutorialScreen = '/firstTutorialScreen';
  static const String secondTutorialScreen = '/secondTutorialScreen';
  static const String thirdTutorialScreen = '/thirdTutorialScreen';
  static const String homeScreen = '/homeScreenForCaption';
  static const String trendingScreen = '/trendingScreen';
  static const String favouriteScreen = '/favouriteScreen';
  static const String settingsScreen = '/settingsScreen';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    String routeName = settings.name ?? RouteUtilities.route;
    dynamic arguments = settings.arguments;
    switch (routeName) {
      case RouteUtilities.route:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashScreen(),
        );
      case RouteUtilities.splashScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashScreen(),
        );
      case RouteUtilities.firstTutorialScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const TutorialScreen(),
        );

      case RouteUtilities.homeScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => Home(
            index: 0,
          ),
        );
      case RouteUtilities.trendingScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashScreen(),
        );
      case RouteUtilities.favouriteScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashScreen(),
        );
      case RouteUtilities.settingsScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashScreen(),
        );
    }
  }
}
