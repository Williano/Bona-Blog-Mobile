import 'package:bona_blog/data/blocs/simple_bloc_delegate.dart';
import 'package:bona_blog/routes/router.dart';
import 'package:bona_blog/screens/home_screen.dart';
import 'package:bona_blog/utils/routes/route_constants_utils.dart';
// import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  BlocSupervisor.delegate = SimpleBlocDelegate();

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
        primaryColorLight: Colors.white,
        primaryColorDark: Colors.black,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        bottomAppBarColor: Color(0xFF04323F),
        appBarTheme: AppBarTheme(color: Colors.blueGrey[900]),
        buttonColor: Color(0xFFD45812),
        primaryColor: Color(0xFF04323F),
        primaryTextTheme:
            TextTheme(headline1: TextStyle(color: Color(0xFFD45812))),
        // primaryColor: Colors.blueGrey[900],
        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline3: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
        //backgroundColor: Color(0xFFEDF3F3),
      ),
      home: HomeScreen(),
    );
  }
}
