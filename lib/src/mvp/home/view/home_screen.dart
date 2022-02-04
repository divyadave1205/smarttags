// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smarttags/src/widgets/view/custom_category_container.dart';
import 'package:smarttags/utilities/font/font_utilities.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('HashtagCategories');
  final CollectionReference collectionReferences =
      FirebaseFirestore.instance.collection('CaptionCategories');
  TabController? myTab;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ThemeBase().whiteColor,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 130),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    color: ThemeBase().backgroundColor,
                    child: TabBar(
                      indicatorColor: ThemeBase().whiteColor,
                      tabs: [
                        Tab(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "Hashtag",
                              style: FontUtilities.h22(
                                fontColor: ThemeBase().whiteColor,
                                fontWeight: FWT.regular,
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "Caption",
                              style: FontUtilities.h22(
                                fontColor: ThemeBase().whiteColor,
                                fontWeight: FWT.regular,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: -50,
                    child: Container(
                      height: 140,
                      width: 175,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: ThemeBase().whiteColor.withOpacity(0.09),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 270,
                    child: Container(
                      height: 140,
                      width: 175,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: ThemeBase().whiteColor.withOpacity(0.09),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: ThemeBase().blackColor.withOpacity(0.09),
                        blurRadius: 7,
                      ),
                    ],
                  ),
                  height: 35,
                  width: 370,
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                            style: BorderStyle.none,
                            width: 0,
                          ),
                        ),
                        filled: true,
                        fillColor: ThemeBase().whiteColor,
                        prefixIcon: Icon(
                          Icons.search,
                          color: ThemeBase().tutorialTextColor1,
                        ),
                        labelText: "Search",
                        labelStyle: TextStyle(
                          color: ThemeBase().tutorialTextColor1,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('HashtagCategories')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                return GridView.count(
                  childAspectRatio: 1,
                  shrinkWrap: true,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  physics: BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  children: [
                    CustomCategoryContainer(
                      width: 50,
                      categoryName: snapshot.data?.docs[0]['categoryName'],
                      left: 20,
                      height: 100,
                      url: snapshot.data?.docs[0]['url'],
                    ),
                    CustomCategoryContainer(
                      width: 50,
                      categoryName: snapshot.data?.docs[3]['categoryName'],
                      right: 20,
                      height: 50,
                      url: snapshot.data?.docs[3]['url'],
                    ),
                    CustomCategoryContainer(
                      width: 50,
                      categoryName: snapshot.data?.docs[5]['categoryName'],
                      left: 20,
                      height: 50,
                      url: snapshot.data?.docs[5]['url'],
                    ),
                    CustomCategoryContainer(
                      width: 50,
                      categoryName: snapshot.data?.docs[1]['categoryName'],
                      right: 20,
                      height: 50,
                      url: snapshot.data?.docs[1]['url'],
                    ),
                    CustomCategoryContainer(
                      width: 50,
                      categoryName: snapshot.data?.docs[7]['categoryName'],
                      left: 20,
                      height: 50,
                      url: snapshot.data?.docs[7]['url'],
                    ),
                    CustomCategoryContainer(
                      width: 50,
                      categoryName: snapshot.data?.docs[6]['categoryName'],
                      right: 20,
                      height: 50,
                      url: snapshot.data?.docs[6]['url'],
                    ),
                    CustomCategoryContainer(
                      width: 50,
                      categoryName: snapshot.data?.docs[2]['categoryName'],
                      left: 20,
                      height: 50,
                      url: snapshot.data?.docs[2]['url'],
                    ),
                    CustomCategoryContainer(
                      width: 50,
                      categoryName: snapshot.data?.docs[4]['categoryName'],
                      right: 20,
                      height: 100,
                      url: snapshot.data?.docs[4]['url'],
                    ),
                  ],
                );
              },
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('CaptionCategories')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                return GridView.count(
                  childAspectRatio: 3.5,
                  shrinkWrap: true,
                  mainAxisSpacing: 20,
                  crossAxisCount: 1,
                  physics: BouncingScrollPhysics(),
                  children: [
                    CustomCategoryContainer(
                      width: 10,
                      radius: 15,
                      categoryName: snapshot.data?.docs[0]['categoryName'],
                      left: 20,
                      right: 20,
                      height: 40,
                      url: snapshot.data?.docs[0]['url'],
                    ),
                    CustomCategoryContainer(
                      width: 50,
                      radius: 15,
                      categoryName: snapshot.data?.docs[3]['categoryName'],
                      right: 20,
                      height: 50,
                      left: 20,
                      url: snapshot.data?.docs[3]['url'],
                    ),
                    CustomCategoryContainer(
                      width: 50,
                      radius: 15,
                      categoryName: snapshot.data?.docs[2]['categoryName'],
                      left: 20,
                      height: 50,
                      right: 20,
                      url: snapshot.data?.docs[2]['url'],
                    ),
                    CustomCategoryContainer(
                      width: 50,
                      categoryName: snapshot.data?.docs[1]['categoryName'],
                      right: 20,
                      radius: 15,
                      left: 20,
                      height: 40,
                      url: snapshot.data?.docs[1]['url'],
                    ),
                    CustomCategoryContainer(
                      width: 50,
                      categoryName: snapshot.data?.docs[4]['categoryName'],
                      left: 20,
                      radius: 15,
                      right: 20,
                      height: 40,
                      url: snapshot.data?.docs[4]['url'],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
