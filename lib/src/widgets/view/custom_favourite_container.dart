// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarttags/src/widgets/view/bottomsheet/provider/bottom_sheet_provider.dart';
import 'package:smarttags/src/widgets/view/custom_icon.dart';
import 'package:smarttags/utilities/asset/asset_utilities.dart';
import 'package:smarttags/utilities/font/font_utilities.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';

class CustomFavouriteContainer extends StatelessWidget {
  final String? categoryName;

  const CustomFavouriteContainer({Key? key, this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        shadowColor: ThemeBase().blackColor.withOpacity(0.5),
        child: Container(
          height: 170,
          width: MediaQuery.of(context).size.width - 30,
          decoration: BoxDecoration(
            color: ThemeBase().whiteColor,
          ),
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 7),
                      child: Text(
                        categoryName ?? "",
                        style: FontUtilities.h18(
                          fontColor: ThemeBase().backgroundColor,
                          fontWeight: FWT.semiBold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0, top: 7),
                    child: Icon(
                      Icons.close,
                      color: ThemeBase().mainTextColor.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              Consumer(
                builder: (context, BottomSheetProvider value, child) {
                  return Wrap(
                    children: value.favouriteList,
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomIcon(
                    url: AssetUtilities.copyIcon,
                    onTap: () {},
                    width: 135,
                  ),
                  CustomIcon(
                    url: AssetUtilities.shareIcon,
                    onTap: () {},
                    width: 135,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
