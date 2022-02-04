import 'package:provider/provider.dart';
import 'package:smarttags/src/mvp/home/provider/hashtag_provider.dart';

class ProviderBind {
  static List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider<HashtagProvider>(
      create: (context) => HashtagProvider(),
    )
  ];
}
