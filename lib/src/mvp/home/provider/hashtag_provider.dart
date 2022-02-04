// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:smarttags/src/mvp/tutorial/view/tutorial_screen.dart';

class HashtagProvider extends ChangeNotifier {
  TutorialScreen _firstTutorialScreen = TutorialScreen();
  TutorialScreen get firstTutorialScreen => _firstTutorialScreen;
  set firstTutorialScreen(TutorialScreen value) {
    _firstTutorialScreen = value;
    notifyListeners();
  }

  void getFirstTutorialScreen(BuildContext context) async {
    firstTutorialScreen = TutorialScreen();
  }
}
