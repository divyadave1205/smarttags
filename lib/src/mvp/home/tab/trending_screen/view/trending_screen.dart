// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, override_on_non_overriding_member

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarttags/src/widgets/view/bottomsheet/provider/bottom_sheet_provider.dart';
import 'package:smarttags/src/widgets/view/custom_appbar.dart';
import 'package:smarttags/src/widgets/view/custom_expandable_container.dart';
import 'package:smarttags/src/widgets/view/custom_hashtag_chip.dart';
import 'package:smarttags/utilities/font/font_utilities.dart';
import 'package:smarttags/utilities/route/route_utilities.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({Key? key}) : super(key: key);

  @override
  _TrendingScreenState createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  bool isExpanded = false;
  bool isExpandedLifestyle = false;
  bool isExpandedAnimal = false;
  bool isExpandedPhotography = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: ThemeBase().whiteColor,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 60),
          child: CustomAppbar(
            pageName: "Trending",
            onTap: () {
              Navigator.of(context).popAndPushNamed(RouteUtilities.homeScreen);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('HashtagCategories')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                return snapshot.hasData
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.start,
                          children: List.generate(3, (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  isExpanded = !isExpanded;
                                });
                              },
                              child: CustomExpandableContainer(
                                collapsedHeight: 120,
                                expandedHeight: 200,
                                // onTap: () {
                                //   setState(() {
                                //     isExpanded = !isExpanded;
                                //   });
                                // },
                                expanded: isExpanded,
                                child: Column(children: [
                                  Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(13.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data?.docs[index]
                                                  ['categoryName'],
                                              style: FontUtilities.h16(
                                                fontColor:
                                                    ThemeBase().mainTextColor,
                                                fontWeight: FWT.semiBold,
                                              ),
                                            ),
                                            StreamBuilder(
                                                stream: FirebaseFirestore
                                                    .instance
                                                    .collection('Hashtags')
                                                    .where('hashCategoryId',
                                                        isEqualTo: 'lifestyle')
                                                    .snapshots(),
                                                builder: (BuildContext context,
                                                    AsyncSnapshot<
                                                            QuerySnapshot<
                                                                Map<String,
                                                                    dynamic>>>
                                                        snapshot) {
                                                  return Wrap(
                                                    children: List.generate(
                                                        isExpanded
                                                            ? snapshot
                                                                    .data
                                                                    ?.docs
                                                                    .length ??
                                                                1
                                                            : 2, (index) {
                                                      return Consumer(builder:
                                                          (context,
                                                              BottomSheetProvider
                                                                  value,
                                                              child) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            value.addCount(
                                                              CustomHashtagChip(
                                                                hashtagName: snapshot
                                                                            .data
                                                                            ?.docs[
                                                                        index][
                                                                    'hashtagName'],
                                                              ),
                                                            );
                                                          },
                                                          child: CustomHashtagChip(
                                                              hashtagName: snapshot
                                                                          .data
                                                                          ?.docs[
                                                                      index][
                                                                  'hashtagName']),
                                                        );
                                                      });
                                                    }),
                                                  );
                                                }),
                                          ]),
                                    ),
                                  ]),
                                ]),
                              ),
                            );
                          }),
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(
                          color: ThemeBase().lineColor,
                          backgroundColor: ThemeBase().primaryColor2,
                        ),
                      );
              }),
        ));
  }
}
