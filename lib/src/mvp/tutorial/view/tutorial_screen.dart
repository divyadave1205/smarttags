// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smarttags/src/mvp/home/view/home_screen.dart';
import 'package:smarttags/src/mvp/home/view/page_view.dart';
import 'package:smarttags/src/widgets/view/custom_elevated_button.dart';
import 'package:smarttags/utilities/asset/asset_utilities.dart';
import 'package:smarttags/utilities/font/font_utilities.dart';
import 'package:smarttags/utilities/route/route_utilities.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';

class TutorialScreen extends StatefulWidget {
  final int selectedIndex;
  const TutorialScreen({Key? key, this.selectedIndex = 0}) : super(key: key);

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  PageController? myPage;
  @override
  void initState() {
    myPage = PageController(initialPage: widget.selectedIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeBase().whiteColor,
      body: PageView(
        controller: myPage,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          FirstTutorial(),
          SecondTutorial(),
          ThirdTutorial(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CustomElevatedButton(
          onTap: () {
            myPage?.nextPage(
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          },
        ),
      ),
    );
  }
}

class FirstTutorial extends StatelessWidget {
  const FirstTutorial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
        ),
        SizedBox(
          height: 250,
          width: 345,
          child: Image.asset(AssetUtilities.firstTutorialScreenVector),
        ),
        SizedBox(
          height: 60,
        ),
        Text(
          'Trending Hashtags',
          style: FontUtilities.h20(
            fontColor: ThemeBase().tutorialTextColor1,
            fontWeight: FWT.semiBold,
          ),
        ),
        SizedBox(
          height: 17,
        ),
        Text(
          'AI Genrated hashtag to get more\n    impression on all your posts,\n           Select, Copy & Paste.',
          style: FontUtilities.h16(
            fontColor: ThemeBase().tutorialTextColor2,
            fontWeight: FWT.regular,
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.circle,
                color: ThemeBase().tutorialCircleColor,
                size: 12,
              ),
            ),
            Icon(
              Icons.circle_outlined,
              color: ThemeBase().tutorialCircleColor,
              size: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.circle_outlined,
                color: ThemeBase().tutorialCircleColor,
                size: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SecondTutorial extends StatelessWidget {
  const SecondTutorial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
        ),
        SizedBox(
          height: 240,
          width: 330,
          child: Image.asset(AssetUtilities.secondTutorialScreenVector),
        ),
        SizedBox(
          height: 60,
        ),
        Text(
          'Caption',
          style: FontUtilities.h20(
            fontColor: ThemeBase().tutorialTextColor1,
            fontWeight: FWT.semiBold,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Collection of new and old captions \n       from entire web for various \n           categoris. Explore Now.',
          style: FontUtilities.h16(
            fontColor: ThemeBase().tutorialTextColor2,
            fontWeight: FWT.regular,
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.circle,
                color: ThemeBase().tutorialCircleColor,
                size: 12,
              ),
            ),
            Icon(
              Icons.circle,
              color: ThemeBase().tutorialCircleColor,
              size: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.circle_outlined,
                color: ThemeBase().tutorialCircleColor,
                size: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ThirdTutorial extends StatelessWidget {
  const ThirdTutorial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
        ),
        SizedBox(
          height: 250,
          width: 345,
          child: Image.asset(AssetUtilities.thirdTutorialScreenVector),
        ),
        SizedBox(
          height: 60,
        ),
        Text(
          'Trending',
          style: FontUtilities.h20(
            fontColor: ThemeBase().tutorialTextColor1,
            fontWeight: FWT.semiBold,
          ),
        ),
        SizedBox(
          height: 17,
        ),
        Text(
          'Hashtags for Instagram, Pintrest, Twitter,\n         TikTok and Facebook. For every \n                     category exist. ',
          style: FontUtilities.h16(
            fontColor: ThemeBase().tutorialTextColor2,
            fontWeight: FWT.regular,
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.circle,
                color: ThemeBase().tutorialCircleColor,
                size: 12,
              ),
            ),
            Icon(
              Icons.circle,
              color: ThemeBase().tutorialCircleColor,
              size: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.circle,
                color: ThemeBase().tutorialCircleColor,
                size: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
