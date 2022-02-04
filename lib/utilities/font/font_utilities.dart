import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontUtilities {
//   static TextStyle h8({
//     required Color? fontColor,
//     FWT fontWeight = FWT.regular,
//     TextDecoration? decoration,
//     double letterSpacing = 0.5,
//   }) {
//     return TextStyle(
//       color: fontColor,
//       fontWeight: getFontWeight(fontWeight),
//       fontSize: 8,
//       letterSpacing: letterSpacing,
//       decoration: decoration,
//     );
//   }

//   static TextStyle h9({
//     required Color? fontColor,
//     FWT fontWeight = FWT.regular,
//     TextDecoration? decoration,
//     double letterSpacing = 0.5,
//   }) {
//     return TextStyle(
//       color: fontColor,
//       fontWeight: getFontWeight(fontWeight),
//       fontSize: 9,
//       letterSpacing: letterSpacing,
//       decoration: decoration,
//     );
//   }

//   static TextStyle h10({
//     required Color? fontColor,
//     FWT fontWeight = FWT.regular,
//     TextDecoration? decoration,
//     double letterSpacing = 0.5,
//   }) {
//     return TextStyle(
//       color: fontColor,
//       fontWeight: getFontWeight(fontWeight),
//       fontSize: 10,
//       letterSpacing: letterSpacing,
//       decoration: decoration,
//     );
//   }

//   static TextStyle h11({
//     required Color? fontColor,
//     FWT fontWeight = FWT.regular,
//     TextDecoration? decoration,
//     double letterSpacing = 0.5,
//   }) {
//     return TextStyle(
//       color: fontColor,
//       fontWeight: getFontWeight(fontWeight),
//       fontSize: 11,
//       letterSpacing: letterSpacing,
//       decoration: decoration,
//     );
//   }

//   static TextStyle h12({
//     required Color? fontColor,
//     TextDecoration? decoration,
//     FWT fontWeight = FWT.regular,
//     double letterSpacing = 0.5,
//   }) {
//     return TextStyle(
//       color: fontColor,
//       fontWeight: getFontWeight(fontWeight),
//       fontSize: 12,
//       letterSpacing: letterSpacing,
//       decoration: decoration,
//     );
//   }

//   static TextStyle h14({
//     required Color? fontColor,
//     FWT fontWeight = FWT.regular,
//     TextDecoration? decoration,
//     double letterSpacing = 0.5,
//   }) {
//     return TextStyle(
//       color: fontColor,
//       fontWeight: getFontWeight(fontWeight),
//       fontSize: 14,
//       letterSpacing: letterSpacing,
//       decoration: decoration,
//     );
//   }

  static TextStyle h16({
    required Color? fontColor,
    FWT fontWeight = FWT.regular,
    TextDecoration? decoration,
    double letterSpacing = 0.5,
  }) {
    return GoogleFonts.openSans(
      color: fontColor,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 16,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }

  static TextStyle h18({
    required Color? fontColor,
    TextDecoration? decoration,
    FWT fontWeight = FWT.regular,
    double letterSpacing = 0.5,
  }) {
    return GoogleFonts.openSans(
      color: fontColor,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 18,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }

  static TextStyle h20({
    required Color? fontColor,
    FWT fontWeight = FWT.regular,
    TextDecoration? decoration,
    double letterSpacing = 0.5,
  }) {
    return GoogleFonts.openSans(
      color: fontColor,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 20,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }

  static TextStyle h22({
    required Color? fontColor,
    FWT fontWeight = FWT.regular,
    TextDecoration? decoration,
    double letterSpacing = 0.5,
  }) {
    return GoogleFonts.openSans(
      color: fontColor,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 22,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }

  // static TextStyle h24({
  //   required Color? fontColor,
  //   FWT fontWeight = FWT.regular,
  //   TextDecoration? decoration,
  //   double letterSpacing = 0.5,
  // }) {
  //   return TextStyle(
  //     color: fontColor,
  //     fontWeight: getFontWeight(fontWeight),
  //     fontSize: 24,
  //     letterSpacing: letterSpacing,
  //     decoration: decoration,
  //   );
  // }
  static TextStyle h25({
    required Color? fontColor,
    FWT fontWeight = FWT.regular,
    TextDecoration? decoration,
    double letterSpacing = 0.5,
  }) {
    return GoogleFonts.openSans(
      color: fontColor,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 25,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }

//   static TextStyle h26({
//     required Color? fontColor,
//     FWT fontWeight = FWT.regular,
//     TextDecoration? decoration,
//     double letterSpacing = 0.5,
//   }) {
//     return TextStyle(
//       color: fontColor,
//       fontWeight: getFontWeight(fontWeight),
//       fontSize: 26,
//       letterSpacing: letterSpacing,
//       decoration: decoration,
//     );
//   }

//   static TextStyle h28({
//     required Color? fontColor,
//     FWT fontWeight = FWT.regular,
//     TextDecoration? decoration,
//     double letterSpacing = 0.5,
//   }) {
//     return TextStyle(
//       color: fontColor,
//       fontWeight: getFontWeight(fontWeight),
//       fontSize: 28,
//       letterSpacing: letterSpacing,
//       decoration: decoration,
//     );
//   }

//   static TextStyle h30({
//     required Color? fontColor,
//     FWT fontWeight = FWT.regular,
//     TextDecoration? decoration,
//     double letterSpacing = 0.5,
//   }) {
//     return TextStyle(
//       color: fontColor,
//       fontWeight: getFontWeight(fontWeight),
//       fontSize: 30,
//       letterSpacing: letterSpacing,
//       decoration: decoration,
//     );
//   }

  // static TextStyle h32({
  //   required Color? fontColor,
  //   FWT fontWeight = FWT.regular,
  //   TextDecoration? decoration,
  //   double letterSpacing = 0.5,
  // }) {
  //   return TextStyle(
  //     color: fontColor,
  //     fontWeight: getFontWeight(fontWeight),
  //     fontSize: 32,
  //     letterSpacing: letterSpacing,
  //     decoration: decoration,
  //   );
  // }

  // static TextStyle h34({
  //   required Color? fontColor,
  //   FWT fontWeight = FWT.regular,
  //   TextDecoration? decoration,
  //   double letterSpacing = 0.5,
  // }) {
  //   return TextStyle(
  //     color: fontColor,
  //     fontWeight: getFontWeight(fontWeight),
  //     fontSize: 34,
  //     letterSpacing: letterSpacing,
  //     decoration: decoration,
  //   );
  // }

  // static TextStyle h36({
  //   required Color? fontColor,
  //   FWT fontWeight = FWT.regular,
  //   TextDecoration? decoration,
  //   double letterSpacing = 0.5,
  // }) {
  //   return TextStyle(
  //     color: fontColor,
  //     fontWeight: getFontWeight(fontWeight),
  //     fontSize: 36,
  //     letterSpacing: letterSpacing,
  //     decoration: decoration,
  //   );
  // }

  // static TextStyle h38({
  //   required Color? fontColor,
  //   FWT fontWeight = FWT.regular,
  //   TextDecoration? decoration,
  //   double letterSpacing = 0.5,
  // }) {
  //   return TextStyle(
  //     color: fontColor,
  //     fontWeight: getFontWeight(fontWeight),
  //     fontSize: 38,
  //     letterSpacing: letterSpacing,
  //     decoration: decoration,
  //   );
  // }

  // static TextStyle h40({
  //   required Color? fontColor,
  //   FWT fontWeight = FWT.regular,
  //   TextDecoration? decoration,
  //   double letterSpacing = 0.5,
  // }) {
  //   return TextStyle(
  //     color: fontColor,
  //     fontWeight: getFontWeight(fontWeight),
  //     fontSize: 40,
  //     letterSpacing: letterSpacing,
  //     decoration: decoration,
  //   );
  // }

  static TextStyle h45({
    required Color? fontColor,
    FWT fontWeight = FWT.regular,
    TextDecoration? decoration,
    double letterSpacing = 0.5,
  }) {
    return GoogleFonts.openSans(
      color: fontColor,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 45,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }

  // static TextStyle h50({
  //   required Color? fontColor,
  //   FWT fontWeight = FWT.regular,
  //   TextDecoration? decoration,
  //   double letterSpacing = 0.5,
  // }) {
  //   return TextStyle(
  //     color: fontColor,
  //     fontWeight: getFontWeight(fontWeight),
  //     fontSize: 50,
  //     letterSpacing: letterSpacing,
  //     decoration: decoration,
  //   );
  // }

  // static TextStyle h55({
  //   required Color? fontColor,
  //   FWT fontWeight = FWT.regular,
  //   TextDecoration? decoration,
  //   double letterSpacing = 0.5,
  // }) {
  //   return TextStyle(
  //     color: fontColor,
  //     fontWeight: getFontWeight(fontWeight),
  //     fontSize: 55,
  //     letterSpacing: letterSpacing,
  //     decoration: decoration,
  //   );
  // }

  // static TextStyle h60({
  //   required Color? fontColor,
  //   FWT fontWeight = FWT.regular,
  //   TextDecoration? decoration,
  //   double letterSpacing = 0.5,
  // }) {
  //   return TextStyle(
  //     color: fontColor,
  //     fontWeight: getFontWeight(fontWeight),
  //     fontSize: 60,
  //     letterSpacing: letterSpacing,
  //     decoration: decoration,
  //   );
  // }

  // static TextStyle h65({
  //   required Color? fontColor,
  //   FWT fontWeight = FWT.regular,
  //   TextDecoration? decoration,
  //   double letterSpacing = 0.5,
  // }) {
  //   return TextStyle(
  //     color: fontColor,
  //     fontWeight: getFontWeight(fontWeight),
  //     fontSize: 65,
  //     letterSpacing: letterSpacing,
  //     decoration: decoration,
  //   );
  // }

  // static TextStyle h70({
  //   required Color? fontColor,
  //   FWT fontWeight = FWT.regular,
  //   TextDecoration? decoration,
  //   double letterSpacing = 0.5,
  // }) {
  //   return TextStyle(
  //     color: fontColor,
  //     fontWeight: getFontWeight(fontWeight),
  //     fontSize: 70,
  //     letterSpacing: letterSpacing,
  //     decoration: decoration,
  //   );
  // }

  // static TextStyle h75({
  //   required Color? fontColor,
  //   FWT fontWeight = FWT.regular,
  //   TextDecoration? decoration,
  //   double letterSpacing = 0.5,
  // }) {
  //   return TextStyle(
  //     color: fontColor,
  //     fontWeight: getFontWeight(fontWeight),
  //     fontSize: 75,
  //     letterSpacing: letterSpacing,
  //     decoration: decoration,
  //   );
  // }

  // static TextStyle h80({
  //   required Color? fontColor,
  //   FWT fontWeight = FWT.regular,
  //   TextDecoration? decoration,
  //   double letterSpacing = 0.5,
  // }) {
  //   return TextStyle(
  //     color: fontColor,
  //     fontWeight: getFontWeight(fontWeight),
  //     fontSize: 80,
  //     letterSpacing: letterSpacing,
  //     decoration: decoration,
  //   );
  // }
}

enum FWT {
  extraBold,

  black,

  bold,

  semiBold,

  medium,

  regular,

  light,
}

FontWeight getFontWeight(FWT fwt) {
  switch (fwt) {
    case FWT.light:
      return FontWeight.w200;
    case FWT.regular:
      return FontWeight.w400;
    case FWT.medium:
      return FontWeight.w500;
    case FWT.semiBold:
      return FontWeight.w600;
    case FWT.bold:
      return FontWeight.w700;
    case FWT.black:
      return FontWeight.w800;

    case FWT.extraBold:
      return FontWeight.w900;
  }
}
