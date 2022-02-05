import 'package:flutter/material.dart';
import 'package:smarttags/src/mvp/tutorial/model/cutom_tutorial_screen_model.dart';
import 'package:smarttags/utilities/asset/asset_utilities.dart';

class TutorialScreenProvider extends ChangeNotifier {
  PageController pageController = PageController(initialPage: 0);
  int _currentSelectedTutorialIndex = 0;

  List<CustomTutorialScreenModel> customTutorialScreenModelList = [
    CustomTutorialScreenModel(
      imageUrl: AssetUtilities.firstTutorialScreenVector,
      index: 0,
      tutorialDiscription:
          'AI Genrated hashtag to get more\n    impression on all your posts,\n           Select, Copy & Paste.',
      tutorialName: 'Trending Hashtags',
    ),
    CustomTutorialScreenModel(
      imageUrl: AssetUtilities.secondTutorialScreenVector,
      index: 1,
      tutorialDiscription:
          'Collection of new and old captions \n       from entire web for various \n           categoris. Explore Now.',
      tutorialName: 'Caption Collections',
    ),
    CustomTutorialScreenModel(
      imageUrl: AssetUtilities.thirdTutorialScreenVector,
      tutorialDiscription:
          'Hashtags for Instagram, Pintrest, Twitter,\n         TikTok and Facebook. For every \n                     category exist. ',
      tutorialName: 'Top Tags',
      index: 2,
    ),
  ];

  int get currentSelectedTutorialIndex => _currentSelectedTutorialIndex;
  set currentSelectedTutorialIndex(int value) {
    _currentSelectedTutorialIndex = value;
    notifyListeners();
  }

  void onPageChange(int currentPageIndex) {
    currentSelectedTutorialIndex = currentPageIndex;
  }

  void moveToNextPage() {
    incrementCurrentPageIndex();
    pageController.animateToPage(
      currentSelectedTutorialIndex,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 200),
    );
  }

  void incrementCurrentPageIndex() {
    if (currentSelectedTutorialIndex !=
        customTutorialScreenModelList.length - 1) {
      currentSelectedTutorialIndex = currentSelectedTutorialIndex + 1;
    }
  }

  void moveToPreviousPage() {
    decrementCurrentPageIndex();
    pageController.animateToPage(
      currentSelectedTutorialIndex,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 200),
    );
  }

  void decrementCurrentPageIndex() {
    if (currentSelectedTutorialIndex != 0) {
      currentSelectedTutorialIndex = currentSelectedTutorialIndex - 1;
    }
  }

  void skipTutorialScreen() {
    if (currentSelectedTutorialIndex !=
        customTutorialScreenModelList.length - 1) {
      currentSelectedTutorialIndex = customTutorialScreenModelList.length - 1;
    }
    pageController.animateToPage(
      currentSelectedTutorialIndex,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 200),
    );
  }
}
