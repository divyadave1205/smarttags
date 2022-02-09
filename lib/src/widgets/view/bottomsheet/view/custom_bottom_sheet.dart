// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarttags/src/widgets/view/bottomsheet/provider/bottom_sheet_provider.dart';
import 'package:smarttags/src/widgets/view/custom_hashtag_chip.dart';
import 'package:smarttags/src/widgets/view/custom_icon.dart';
import 'package:smarttags/utilities/asset/asset_utilities.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:smarttags/utilities/font/font_utilities.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      builder: (BuildContext context) {
        return SizedBox(
          height: 100,
          child: Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Consumer(
                  builder: (BuildContext context,
                      BottomSheetProvider bottomSheetProvider, Widget? child) {
                    return CustomIcon(
                      onTap: () {
                        bottomSheetProvider.copyHashtag().then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Hashtag Copied",
                                style: FontUtilities.h16(
                                  fontColor: ThemeBase().whiteColor,
                                  fontWeight: FWT.semiBold,
                                ),
                              ),
                              duration: Duration(milliseconds: 500),
                              backgroundColor: ThemeBase().primaryColor2,
                            ),
                          );
                        });
                      },
                      url: AssetUtilities.copyIcon,
                      width: 82,
                    );
                  },
                ),
                Consumer(
                  builder: (BuildContext context,
                      BottomSheetProvider bottomSheetProvider, Widget? child) {
                    return CustomIcon(
                      onTap: () {
                        bottomSheetProvider.favouriteList.add(CustomHashtagChip(
                          hashtagName: "...........",
                        ));
                      },
                      url: AssetUtilities.favouriteIcon,
                      width: 82,
                    );
                  },
                ),
                CustomIcon(
                  onTap: () async {
                    await FlutterShare.share(title: 'title');
                  },
                  url: AssetUtilities.shareIcon,
                  width: 82,
                ),
                CustomIcon(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  url: AssetUtilities.closeIcon,
                  width: 82,
                ),
              ],
            ),
          ),
        );
      },
      onClosing: () {},
    );
  }
}
