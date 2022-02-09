// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smarttags/src/widgets/view/Custom_search_bar.dart';
import 'package:smarttags/src/widgets/view/bottomsheet/provider/bottom_sheet_provider.dart';
import 'package:smarttags/src/widgets/view/custom_appbar.dart';
import 'package:smarttags/src/widgets/view/custom_favourite_container.dart';
import 'package:smarttags/utilities/asset/asset_utilities.dart';
import 'package:smarttags/utilities/font/font_utilities.dart';
import 'package:smarttags/utilities/route/route_utilities.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeBase().whiteColor,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 60),
        child: CustomAppbar(
          pageName: "Favourites",
          onTap: () {
            Navigator.of(context).popAndPushNamed(RouteUtilities.homeScreen);
          },
        ),
      ),
      body:
          // BottomSheetProvider().favouriteList.isEmpty
          //     ? Center(
          //         child: Column(
          //           children: [
          //             SizedBox(height: 100),
          //             Image.asset(
          //               AssetUtilities.favourtieScreenVector,
          //             ),
          //             Text(
          //               "Here you will find your favourite collections",
          //               style: FontUtilities.h16(
          //                 fontColor: ThemeBase().mainTextColor,
          //               ),
          //             )
          //           ],
          //         ),
          //       )
          //     :
          SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            CustomSearchBar(),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('HashtagCategories')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(
                      child: Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.start,
                        children: List.generate(
                          snapshot.data?.docs.length ?? 1,
                          (index) {
                            return CustomFavouriteContainer(
                              categoryName: snapshot.data?.docs[index]
                                  ['categoryName'],
                            );
                          },
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
