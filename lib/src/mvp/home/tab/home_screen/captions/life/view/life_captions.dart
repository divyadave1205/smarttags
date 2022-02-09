// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smarttags/src/widgets/view/custom_appbar.dart';
import 'package:smarttags/src/widgets/view/custom_caption_container.dart';
import 'package:smarttags/utilities/font/font_utilities.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';

class LifeCaptions extends StatefulWidget {
  const LifeCaptions({Key? key}) : super(key: key);

  @override
  _LifeCaptionsState createState() => _LifeCaptionsState();
}

class _LifeCaptionsState extends State<LifeCaptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 60),
        child: CustomAppbar(
          pageName: "Life",
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('LifeCaptions')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.start,
                      children: List.generate(
                        snapshot.data?.docs.length ?? 1,
                        (index) {
                          return CustomCaptionContainer(
                            caption: snapshot.data?.docs[index]['caption'],
                            speakerName: snapshot.data?.docs[index]
                                ['speakerName'],
                          );
                        },
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
