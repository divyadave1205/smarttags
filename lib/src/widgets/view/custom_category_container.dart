// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:smarttags/utilities/font/font_utilities.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';

class CustomCategoryContainer extends StatelessWidget {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('HashtagCategories');
  final double? height;
  final double? width;

  final double? bottom;
  final double? top;
  final double? left;
  final double? radius;
  final double? right;
  final String? url;
  final String? categoryName;
  CustomCategoryContainer(
      {Key? key,
      this.height,
      this.url,
      this.bottom,
      this.top,
      this.left,
      this.right,
      this.categoryName,
      this.width,
      this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: bottom ?? 0,
          left: left ?? 0,
          right: right ?? 0,
          top: top ?? 0,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius ?? 10),
                image: DecorationImage(
                  image: AssetImage(url ?? ""),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: ThemeBase().blackColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  categoryName ?? "",
                  style: FontUtilities.h25(
                    fontColor: ThemeBase().whiteColor,
                    fontWeight: FWT.semiBold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
