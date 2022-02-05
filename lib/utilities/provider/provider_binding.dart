import 'package:provider/provider.dart';
import 'package:smarttags/src/mvp/home/home_main/provider/hashtag_provider.dart';
import 'package:smarttags/src/mvp/tutorial/provider/tutorial_screen_provider.dart';

class ProviderBind {
  static List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider<HashtagProvider>(
      create: (context) => HashtagProvider(),
    ),
    ChangeNotifierProvider<TutorialScreenProvider>(
      create: (context) => TutorialScreenProvider(),
    ),
  ];
}
