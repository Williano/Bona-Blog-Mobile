import 'package:bona_blog/routes/router.dart';
import 'package:bona_blog/screens/home_screen.dart';
import 'package:bona_blog/utilities/custom_material_color.dart';
import 'package:bona_blog/utilities/route_constants.dart';
// import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(BonaBlog()));
}

// void main() => runApp(
//       DevicePreview(
//         builder: (context) => BonaBlog(),
//       ),
//     );

class BonaBlog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // locale: DevicePreview.of(context).locale, // <--- Add the locale
      // builder: DevicePreview.appBuilder,
      onGenerateRoute: generateRoute,
      initialRoute: HomeScreenRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: customColor,
        primaryColorLight: Colors.white,
        primaryColorDark: Colors.black,
        backgroundColor: Color(0xFFEDF3F3),
      ),
      home: HomeScreen(),
    );
  }
}
