import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarttags/src/widgets/view/custom_hashtag_chip.dart';

class BottomSheetProvider extends ChangeNotifier {
  final List<CustomHashtagChip> favouriteList = [];
  int count = 0;
  void addCount(CustomHashtagChip item) {
    if (favouriteList.where((element) {
      return element.hashtagName == item.hashtagName;
    }).isNotEmpty) {
      favouriteList.add(item);
      count++;
      notifyListeners();
    }
  }

  void lessCount(CustomHashtagChip item) {
    if (favouriteList.where((element) {
      return element.hashtagName == item.hashtagName;
    }).isNotEmpty) {
      count--;
      notifyListeners();
    }
  }

  Future<void> copyHashtag() {
    return FlutterClipboard.copy('hi');
  }
}
