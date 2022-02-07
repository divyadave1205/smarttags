// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, override_on_non_overriding_member

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smarttags/src/widgets/view/custom_expandable_container.dart';
import 'package:smarttags/src/widgets/view/custom_hashtag_chip.dart';
import 'package:smarttags/utilities/font/font_utilities.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({Key? key}) : super(key: key);

  @override
  _TrendingScreenState createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  bool isExpandedLifestyle = true;
  bool isExpandedPhotography = true;
  bool isExpandedAnimal = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeBase().whiteColor,
      appBar: AppBar(
        toolbarHeight: 60,
        leading: Icon(Icons.arrow_back),
        leadingWidth: 50,
        backgroundColor: ThemeBase().backgroundColor,
        title: Text(
          "Trending",
          style: FontUtilities.h22(
            fontColor: ThemeBase().whiteColor,
            fontWeight: FWT.semiBold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 15),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Hashtags')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    return CustomExpandableContainer(
                      child: Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.start,
                        children: List.generate(3, (index) {
                          return CustomExpandableContainer(child: Column(children: [],),);
                        }),
                      ),
                    );

                    //  GestureDetector(
                    //     onTap: () {
                    //       setState(() {
                    //         isExpandedLifestyle = !isExpandedLifestyle;
                    //       });
                    //     },
                    //     child: CustomExpandableContainer(
                    //       expanded: isExpandedLifestyle,
                    //       child: Column(
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         children: [
                    //           Align(
                    //             alignment: Alignment.centerLeft,
                    //             child: Padding(
                    //               padding:
                    //                   const EdgeInsets.only(left: 27.0, top: 20),
                    //               child: Text(
                    //                 "Lifestyle",
                    //                 style: FontUtilities.h16(
                    //                   fontWeight: FWT.semiBold,
                    //                   fontColor: ThemeBase().mainTextColor,
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //           isExpandedLifestyle
                    //               ? StreamBuilder(
                    //                   stream: FirebaseFirestore.instance
                    //                       .collection('LifestyleHashtags')
                    //                       .snapshots(),
                    //                   builder: (BuildContext context,
                    //                       AsyncSnapshot<
                    //                               QuerySnapshot<
                    //                                   Map<String, dynamic>>>
                    //                           snapshot) {
                    //                     return Padding(
                    //                       padding: const EdgeInsets.all(8.0),
                    //                       child: Wrap(
                    //                         direction: Axis.horizontal,
                    //                         alignment: WrapAlignment.start,
                    //                         children: List.generate(3, (index) {
                    //                           return CustomHashtagChip(
                    //                             hashtagName: snapshot.data
                    //                                 ?.docs[index]['hastagName'],
                    //                           );
                    //                         }),
                    //                       ),
                    //                     );
                    //                   })
                    //               : StreamBuilder(
                    //                   stream: FirebaseFirestore.instance
                    //                       .collection('Hashtags')
                    //                       .snapshots(),
                    //                   builder: (BuildContext context,
                    //                       AsyncSnapshot<
                    //                               QuerySnapshot<
                    //                                   Map<String, dynamic>>>
                    //                           snapshot) {
                    //                     return Padding(
                    //                       padding: const EdgeInsets.all(8.0),
                    //                       child: Wrap(
                    //                         direction: Axis.horizontal,
                    //                         alignment: WrapAlignment.start,
                    //                         children: List.generate(
                    //                             snapshot.data?.docs.length ?? 0,
                    //                             (index) {
                    //                           return CustomHashtagChip(
                    //                             hashtagName:
                    //                                 snapshot.data?.docs[index]
                    //                                         ['LifestyleHashtags']
                    //                                     ['hastagName'],
                    //                           );
                    //                         }),
                    //                       ),
                    //                     );
                    //                   }),
                    //         ],
                    //       ),
                    //       collapsedHeight: 200,
                    //       expandedHeight: 110,
                    //     ),
                    //   );
                  }),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpandedPhotography = !isExpandedPhotography;
                  });
                },
                child: CustomExpandableContainer(
                  expanded: isExpandedPhotography,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 27.0, top: 20),
                          child: Text(
                            "Photography",
                            style: FontUtilities.h16(
                              fontWeight: FWT.semiBold,
                              fontColor: ThemeBase().mainTextColor,
                            ),
                          ),
                        ),
                      ),
                      isExpandedPhotography
                          ? StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('PhotographyHashtags')
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<
                                          QuerySnapshot<Map<String, dynamic>>>
                                      snapshot) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Wrap(
                                    direction: Axis.horizontal,
                                    alignment: WrapAlignment.start,
                                    children: List.generate(2, (index) {
                                      return CustomHashtagChip(
                                        hashtagName: snapshot.data?.docs[index]
                                            ['hastagName'],
                                      );
                                    }),
                                  ),
                                );
                              })
                          : StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('PhotographyHashtags')
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<
                                          QuerySnapshot<Map<String, dynamic>>>
                                      snapshot) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Wrap(
                                    direction: Axis.horizontal,
                                    alignment: WrapAlignment.start,
                                    children: List.generate(
                                        snapshot.data?.docs.length ?? 0,
                                        (index) {
                                      return CustomHashtagChip(
                                        hashtagName: snapshot.data?.docs[index]
                                            ['hastagName'],
                                      );
                                    }),
                                  ),
                                );
                              }),
                    ],
                  ),
                  collapsedHeight: 110,
                  expandedHeight: 200,
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpandedAnimal = !isExpandedAnimal;
                  });
                },
                child: CustomExpandableContainer(
                  expanded: isExpandedAnimal,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 27.0, top: 20),
                          child: Text(
                            "Animal",
                            style: FontUtilities.h16(
                              fontWeight: FWT.semiBold,
                              fontColor: ThemeBase().mainTextColor,
                            ),
                          ),
                        ),
                      ),
                      isExpandedAnimal
                          ? StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('AnimalHashtag')
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<
                                          QuerySnapshot<Map<String, dynamic>>>
                                      snapshot) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Wrap(
                                    direction: Axis.horizontal,
                                    alignment: WrapAlignment.start,
                                    children: List.generate(3, (index) {
                                      return CustomHashtagChip(
                                        hashtagName: snapshot.data?.docs[index]
                                            ['hastagName'],
                                      );
                                    }),
                                  ),
                                );
                              })
                          : StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('AnimalHashtag')
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<
                                          QuerySnapshot<Map<String, dynamic>>>
                                      snapshot) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Wrap(
                                    direction: Axis.horizontal,
                                    alignment: WrapAlignment.start,
                                    children: List.generate(
                                        snapshot.data?.docs.length ?? 0,
                                        (index) {
                                      return CustomHashtagChip(
                                        hashtagName: snapshot.data?.docs[index]
                                            ['hastagName'],
                                      );
                                    }),
                                  ),
                                );
                              }),
                    ],
                  ),
                  collapsedHeight: 110,
                  expandedHeight: 200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
