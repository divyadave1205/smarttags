// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
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
  int? selectedIndex = 0;

  onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onPageChange(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeBase().whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: BottomNavigationBar(
        showUnselectedLabels: false,
        iconSize: 25,
        currentIndex: 0,
        showSelectedLabels: false,
        backgroundColor: ThemeBase().backgroundColor,
        onTap: onItemTapped,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
            activeIcon: Wrap(
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.home,
                      color: ThemeBase().backgroundColor,
                    ),
                    Icon(
                      Icons.circle,
                      color: ThemeBase().backgroundColor,
                      size: 8,
                    ),
                  ],
                ),
              ],
            ),
            label: ".",
            icon: Icon(
              Icons.home_outlined,
              color: ThemeBase().backgroundColor,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Column(
              children: [
                Icon(
                  Icons.home,
                  color: ThemeBase().backgroundColor,
                ),
                Icon(
                  Icons.circle,
                  color: ThemeBase().backgroundColor,
                ),
              ],
            ),
            label: ".",
            icon: Icon(
              Icons.home,
              color: ThemeBase().backgroundColor,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Column(
              children: [
                Icon(
                  Icons.home,
                  color: ThemeBase().backgroundColor,
                ),
                Icon(
                  Icons.circle,
                  color: ThemeBase().backgroundColor,
                ),
              ],
            ),
            icon: Icon(
              Icons.home,
              color: ThemeBase().backgroundColor,
            ),
            label: ".",
          ),
          BottomNavigationBarItem(
            activeIcon: Column(
              children: [
                Icon(
                  Icons.home,
                  color: ThemeBase().backgroundColor,
                ),
                Icon(
                  Icons.circle,
                  color: ThemeBase().backgroundColor,
                ),
              ],
            ),
            icon: Icon(
              Icons.home,
              color: ThemeBase().backgroundColor,
            ),
            label: ".",
          ),
        ],
      ),
    );
  }
}

class BottomnavigationBarMaker extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ThemeBase().backgroundColor
      ..style = PaintingStyle.fill;
    final path = Path()..moveTo(0, 0);
    path.quadraticBezierTo(
        size.width * 0.5, size.height, size.width * 0.50, size.height);

    path.arcToPoint(
      Offset(size.width * 0.60, 0),
      radius: Radius.circular(5),
      clockwise: false,
    );
    path.quadraticBezierTo(size.width * 0.60, -3, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant BottomnavigationBarMaker oldDelegate) {
    return true;
  }
}
