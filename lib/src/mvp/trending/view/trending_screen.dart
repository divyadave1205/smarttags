// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:smarttags/utilities/font/font_utilities.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({Key? key}) : super(key: key);

  @override
  _TrendingScreenState createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 130),
        child: Stack(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                color: ThemeBase().backgroundColor,
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Icon(
                        Icons.arrow_back,
                        color: ThemeBase().whiteColor,
                      ),
                    ),
                    Text(
                      "Trending",
                      style: FontUtilities.h22(
                        fontColor: ThemeBase().whiteColor,
                      ),
                    ),
                  ],
                )),
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExpansionPanelList(
              animationDuration: Duration(milliseconds: 500),
              expansionCallback: (panelIndex, isExpanded) {},
              children: [
                ExpansionPanel(
                  canTapOnHeader: true,
                  isExpanded: true,
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return SizedBox();
                  },
                  body: Container(
                    child: Text("data"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
