import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smarttags/utilities/provider/provider_binding.dart';
import 'package:smarttags/utilities/route/route_utilities.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const SmartTagsApplication());
}

class SmartTagsApplication extends StatelessWidget {
  const SmartTagsApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderBind.providers,
      builder: (BuildContext context, Widget? child) {
        // ignore: prefer_const_constructors
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RouteUtilities.route,
          onGenerateRoute: RouteUtilities.onGenerateRoute,
          theme: ThemeData(
            textTheme: GoogleFonts.openSansTextTheme(),
          ),
        );
      },
    );
  }
}
