// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smarttags/utilities/asset/asset_utilities.dart';
import 'package:smarttags/utilities/font/font_utilities.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';

class CustomCaptionContainer extends StatefulWidget {
  final String? caption;
  final String? speakerName;
  const CustomCaptionContainer({Key? key, this.caption, this.speakerName})
      : super(key: key);

  @override
  _CustomCaptionContainerState createState() => _CustomCaptionContainerState();
}

class _CustomCaptionContainerState extends State<CustomCaptionContainer> {
  bool isCopied = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25,
      ),
      child: Card(
        shadowColor: ThemeBase().blackColor.withOpacity(0.5),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        child: SizedBox(
          height: 140,
          width: MediaQuery.of(context).size.width - 30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Text(
                      widget.caption ?? "",
                      style: FontUtilities.h13(
                        fontColor: ThemeBase().mainTextColor,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 2,
                      width: 10,
                      color: ThemeBase().mainTextColor,
                    ),
                  ),
                  Text(
                    widget.speakerName ?? "",
                    style: FontUtilities.h13(
                      fontColor: ThemeBase().mainTextColor,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 1.5,
                width: MediaQuery.of(context).size.width - 50,
                color: ThemeBase().lineColor,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: 20),
                  isCopied == true
                      ? Expanded(
                          child: Wrap(
                            children: [
                              Container(
                                height: 28,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      ThemeBase().primaryColor2,
                                      ThemeBase().primaryColor1,
                                    ],
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '2456 Copies',
                                    style: FontUtilities.h9(
                                      fontColor: ThemeBase().whiteColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isCopied = true;
                      });
                    },
                    child: Image.asset(AssetUtilities.copyIcon),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 20.0,
                      left: 12,
                    ),
                    child: Image.asset(AssetUtilities.shareIcon),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
