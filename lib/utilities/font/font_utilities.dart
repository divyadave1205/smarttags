import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontUtilities {
  static TextStyle h9({
    required Color? fontColor,
    FWT fontWeight = FWT.regular,
    TextDecoration? decoration,
    double letterSpacing = 0.5,
  }) {
    return GoogleFonts.openSans(
      color: fontColor,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 9,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }

  static TextStyle h13({
    required Color? fontColor,
    FWT fontWeight = FWT.regular,
    TextDecoration? decoration,
    double letterSpacing = 0.5,
  }) {
    return GoogleFonts.openSans(
      color: fontColor,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 13,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }

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
