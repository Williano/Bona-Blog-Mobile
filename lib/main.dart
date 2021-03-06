import 'package:bona_blog/features/article/bloc/article_bloc.dart';
import 'package:bona_blog/features/category/bloc/category_bloc.dart';
import 'package:bona_blog/shared/bloc/simple_bloc_delegate.dart';
import 'package:bona_blog/injection_container.dart';
import 'package:bona_blog/routes/router.dart';
import 'package:bona_blog/features/bottom_navigation_screen.dart';
import 'package:bona_blog/shared/utils/routes/route_constants_utils.dart';
import 'injection_container.dart' as dependencyInjection;
// import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dependencyInjection.init();

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryBloc>(
          create: (context) =>
              servicelocator<CategoryBloc>()..add(GetCategoriesEvent()),
        ),
        BlocProvider<ArticleBloc>(
          create: (context) =>
              servicelocator<ArticleBloc>()..add(GetArticlesEvent()),
        ),
      ],
      child: MaterialApp(
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
        home: BottomNavigationScreen(),
      ),
    );
  }
}
