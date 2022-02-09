// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smarttags/src/widgets/view/custom_category_container.dart';
import 'package:smarttags/utilities/font/font_utilities.dart';
import 'package:smarttags/utilities/route/route_utilities.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatefulWidget {
  int pageIndex = 0;
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          preferredSize: Size(MediaQuery.of(context).size.width, 95),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 55,
                child: AppBar(
                  flexibleSpace: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RouteUtilities.searchScreen);
                        },
                        child: Icon(
                          Icons.search,
                          color: ThemeBase().whiteColor,
                        ),
                      ),
                    ),
                  ),
                  backgroundColor: ThemeBase().backgroundColor,
                  leading: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Smartags",
                      style: FontUtilities.h22(
                        fontColor: ThemeBase().whiteColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  leadingWidth: MediaQuery.of(context).size.width,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                color: ThemeBase().backgroundColor,
                child: TabBar(
                  indicatorColor: ThemeBase().whiteColor,
                  tabs: [
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
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
                        alignment: Alignment.center,
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
                return StaggeredGridView.countBuilder(
                  mainAxisSpacing: 20,
                  padding: EdgeInsets.all(20),
                  shrinkWrap: true,
                  itemCount: snapshot.data?.docs.length,
                  crossAxisSpacing: 20,
                  crossAxisCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomCategoryContainer(
                      categoryName: snapshot.data?.docs[index]['categoryName'],
                      url: snapshot.data?.docs[index]['url'],
                    );
                  },
                  staggeredTileBuilder: (int index) {
                    return StaggeredTile.count(
                      1,
                      index.isEven ? 1.2 : 1,
                    );
                  },
                );
              },
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('CaptionCategories')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data?.docs.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return AspectRatio(
                      aspectRatio: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 15.0,
                          left: 15.0,
                          right: 15.0,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(RouteUtilities.lifeCaptionsScreen);
                          },
                          child: CustomCategoryContainer(
                            categoryName: snapshot.data?.docs[index]
                                ['categoryName'],
                            left: 5,
                            url: snapshot.data?.docs[index]['url'],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
