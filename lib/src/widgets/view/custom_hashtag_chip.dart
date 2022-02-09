// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarttags/src/widgets/view/bottomsheet/provider/bottom_sheet_provider.dart';
import 'package:smarttags/src/widgets/view/bottomsheet/view/custom_bottom_sheet.dart';
import 'package:smarttags/utilities/font/font_utilities.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class CustomHashtagChip extends StatefulWidget {
  final String? hashtagName;
  const CustomHashtagChip({Key? key, this.hashtagName}) : super(key: key);

  @override
  _CustomHashtagChipState createState() => _CustomHashtagChipState();
}

class _CustomHashtagChipState extends State<CustomHashtagChip> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, BottomSheetProvider value, child) {
        return GestureDetector(
          onTap: () {
            setState(() {
              isSelected = !isSelected;

              isSelected == true ? value.count++ : value.count--;
              scaffoldKey.currentState?.showBottomSheet((context) {
                return CustomBottomSheet();
              });
            });
          },
          child: Wrap(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, top: 10),
                height: 33,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: isSelected
                        ? [
                            ThemeBase().primaryColor1,
                            ThemeBase().primaryColor2,
                          ]
                        : [
                            ThemeBase().unselectedHashtagColor,
                            ThemeBase().unselectedHashtagColor,
                          ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.hashtagName ?? "",
                    style: FontUtilities.h13(
                      fontColor: isSelected
                          ? ThemeBase().whiteColor
                          : ThemeBase().mainTextColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
