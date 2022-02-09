// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarttags/src/mvp/tutorial/provider/tutorial_screen_provider.dart';
import 'package:smarttags/src/widgets/view/custom_elevated_button.dart';
import 'package:smarttags/src/widgets/view/custom_text_button.dart';
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
      body: Consumer(
        builder: (BuildContext context,
            TutorialScreenProvider tutorialScreenProvider, Widget? child) {
          return Column(
            children: [
              Expanded(
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  onPageChanged: tutorialScreenProvider.onPageChange,
                  children: tutorialScreenProvider.customTutorialScreenModelList
                      .map((e) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        SizedBox(
                          height: 250,
                          width: 345,
                          child: Image.asset(e.imageUrl ?? ""),
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        Text(
                          e.tutorialName ?? "",
                          style: FontUtilities.h20(
                            fontColor: ThemeBase().mainTextColor,
                            fontWeight: FWT.semiBold,
                          ),
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        Text(
                          e.tutorialDiscription ?? "",
                          style: FontUtilities.h16(
                            fontColor: ThemeBase().tutorialTextColor2,
                            fontWeight: FWT.regular,
                          ),
                        ),
                      ],
                    );
                  }).toList(),

                  controller: tutorialScreenProvider.pageController,
                  // ignore: prefer_const_literals_to_create_immutables
                ),
              ),
              Consumer(
                builder: (BuildContext context,
                    TutorialScreenProvider tutorialScreenProvider,
                    Widget? child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      tutorialScreenProvider
                          .customTutorialScreenModelList.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            tutorialScreenProvider
                                            .currentSelectedTutorialIndex ==
                                        index &&
                                    tutorialScreenProvider
                                            .currentSelectedTutorialIndex <=
                                        index
                                ? Icons.circle
                                : Icons.circle_outlined,
                            color: ThemeBase().primaryColor2,
                            size: 12,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              SizedBox(
                height: 50,
              ),
              Consumer(
                builder: (BuildContext context,
                    TutorialScreenProvider tutorialScreenProvider,
                    Widget? child) {
                  return tutorialScreenProvider.currentSelectedTutorialIndex ==
                          2
                      ? Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: CustomElevatedButton(
                            height: 45,
                            width: 160,
                            child: Center(
                              child: Text(
                                "Get Started",
                                style: FontUtilities.h18(
                                  fontColor: ThemeBase().whiteColor,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                RouteUtilities.homeScreen,
                                (route) =>
                                    route.toString() == RouteUtilities.route,
                              );
                            },
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CustomTextButton(
                                buttonName: "Skip",
                                onPressed: () {
                                  tutorialScreenProvider.skipTutorialScreen();
                                },
                              ),
                              SizedBox(
                                width: 250,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomElevatedButton(
                                  height: 50,
                                  width: 55,
                                  child: Icon(
                                    Icons.navigate_next,
                                    size: 30,
                                    color: ThemeBase().whiteColor,
                                  ),
                                  onTap: () {
                                    tutorialScreenProvider.moveToNextPage();
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
