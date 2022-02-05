// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomTutorialScreenModel {
  final String? tutorialName;
  final String? tutorialDiscription;
  final String? imageUrl;
  final int? index;
  CustomTutorialScreenModel(
      {Key? key,
      this.tutorialName,
      this.tutorialDiscription,
      this.imageUrl,
      this.index});
}
