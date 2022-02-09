import 'package:flutter/material.dart';
import 'package:smarttags/src/mvp/home/home_main/view/home.dart';
import 'package:smarttags/src/mvp/home/tab/home_screen/captions/life/view/life_captions.dart';
import 'package:smarttags/src/mvp/home/tab/home_screen/hashtags/food/view/food.dart';
import 'package:smarttags/src/mvp/home/tab/home_screen/search_screen/view/search_screen.dart';
import 'package:smarttags/src/mvp/splash/view/splash_screen.dart';
import 'package:smarttags/src/mvp/tutorial/view/tutorial_screen.dart';

class RouteUtilities {
  static const String route = '/';
  static const String splashScreen = '/splashScreen';
  static const String tutorialScreen = '/firstTutorialScreen';
  static const String homeScreen = '/homeScreen';
  static const String trendingScreen = '/trendingScreen';
  static const String favouriteScreen = '/favouriteScreen';
  static const String settingsScreen = '/settingsScreen';
  static const String searchScreen = '/searchScreen';
  static const String foodHashtagsScreen = '/foodHashtagsScreen';
  static const String lifeCaptionsScreen = '/lifeCaptionsScreen';

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
      case RouteUtilities.tutorialScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const TutorialScreen(),
        );
      case RouteUtilities.homeScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => Home(
            index: 0,
          ),
        );

      case RouteUtilities.searchScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SearchScreen(),
        );
      case RouteUtilities.foodHashtagsScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const Food(),
        );
      case RouteUtilities.lifeCaptionsScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LifeCaptions(),
        );
    }
  }
}
