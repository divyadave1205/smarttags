// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smarttags/utilities/asset/asset_utilities.dart';
import 'package:smarttags/utilities/theme/theme_base.dart';

typedef OnPageChangeCallBack = void Function(int);

class CustomBottomNavigationBar extends StatefulWidget {
  final OnPageChangeCallBack onPageChange;

  CustomBottomNavigationBar({Key? key, required this.onPageChange})
      : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;

  onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onPageChange(index);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: Material(
        shadowColor: ThemeBase().blackColor,
        color: ThemeBase().whiteColor,
        child: CustomPaint(
          willChange: true,
          isComplex: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30.0,
                      right: 30.0,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                        onItemTapped(selectedIndex);
                      },
                      child: selectedIndex == 0
                          ? Align(
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                children: [
                                  Image.asset(AssetUtilities.homeFillIcon),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.circle,
                                      color: ThemeBase().backgroundColor,
                                      size: 8,
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Image.asset(AssetUtilities.homeOutlineIcon),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30.0,
                      right: 30.0,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                        onItemTapped(selectedIndex);
                      },
                      child: selectedIndex == 1
                          ? Align(
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                children: [
                                  Image.asset(AssetUtilities.trendingFillIcon),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.circle,
                                      color: ThemeBase().backgroundColor,
                                      size: 8,
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Image.asset(AssetUtilities.trendingOutlineIcon),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 100.0,
                      right: 30.0,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                        onItemTapped(selectedIndex);
                      },
                      child: selectedIndex == 2
                          ? Align(
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                children: [
                                  Image.asset(
                                      AssetUtilities.favouritesFillIcon),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.circle,
                                      color: ThemeBase().backgroundColor,
                                      size: 8,
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Image.asset(AssetUtilities.favouritesOutlineIcon),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30.0,
                      right: 30.0,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 3;
                        });
                        onItemTapped(selectedIndex);
                      },
                      child: selectedIndex == 3
                          ? Align(
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                children: [
                                  Image.asset(AssetUtilities.settingsFillIcon),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.circle,
                                      color: ThemeBase().backgroundColor,
                                      size: 8,
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Image.asset(AssetUtilities.settingsOutlineIcon),
                    ),
                  ),
                ],
              ),
            ],
          ),
          painter: BottomnavigationBarMaker(),
        ),
      ),
    );
  }
}

class BottomnavigationBarMaker extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ThemeBase().lineColor.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final path = Path()..moveTo(140, 5);
    path.lineTo(0, 5);
    path.lineTo(0, 60);
    path.lineTo(413, 60);
    path.lineTo(413, 5);
    path.lineTo(270, 5);
    path.moveTo(140, 5);
    path.cubicTo(180, 9, size.width * 0.43, 50, 215, 40);
    path.cubicTo(230, 40, 250, 1, 270, 5);

    canvas.drawPath(path, paint);
    path.close();
  }

  @override
  bool shouldRepaint(covariant BottomnavigationBarMaker oldDelegate) {
    return true;
  }
}
