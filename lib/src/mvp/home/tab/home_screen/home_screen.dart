// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smarttags/src/widgets/view/custom_category_container.dart';
import 'package:smarttags/utilities/font/font_utilities.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
          preferredSize: Size(MediaQuery.of(context).size.width, 120),
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
                      child: Icon(
                        Icons.search,
                        color: ThemeBase().whiteColor,
                      ),
                    ),
                  ),
                  backgroundColor: ThemeBase().backgroundColor,
                  leading: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Smartags",
                        style: FontUtilities.h22(
                          fontColor: ThemeBase().whiteColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
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
                return GridView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: snapshot.data?.docs.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomCategoryContainer(
                          width: 50,
                          categoryName: snapshot.data?.docs[index]
                              ['categoryName'],
                          left: 5,
                          height: 100,
                          url: snapshot.data?.docs[index]['url'],
                        ),
                      );
                    });
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
                        child: CustomCategoryContainer(
                          width: 50,
                          categoryName: snapshot.data?.docs[index]
                              ['categoryName'],
                          left: 5,
                          height: 100,
                          url: snapshot.data?.docs[index]['url'],
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
