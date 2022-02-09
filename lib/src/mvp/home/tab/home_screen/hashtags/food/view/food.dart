import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smarttags/src/widgets/view/custom_appbar.dart';
import 'package:smarttags/src/widgets/view/custom_expandable_container.dart';
import 'package:smarttags/utilities/font/font_utilities.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';

class Food extends StatefulWidget {
  const Food({Key? key}) : super(key: key);

  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {
  bool isExpanded = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 60),
        child: CustomAppbar(
          pageName: "Food",
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('FoodHashtags')
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.start,
                    children:
                        List.generate(snapshot.data?.docs.length ?? 1, (index) {
                      return CustomExpandableContainer(
                        collapsedHeight: 300,
                        expandedHeight: 400,
                        expanded: isExpanded,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(13.0),
                                  child: Text(
                                    snapshot.data?.docs[index]['categoryName'],
                                    style: FontUtilities.h16(
                                      fontColor: ThemeBase().mainTextColor,
                                      fontWeight: FWT.semiBold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
