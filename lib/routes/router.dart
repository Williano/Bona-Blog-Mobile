import 'package:bona_blog/screens/home_screen.dart';
import 'package:bona_blog/screens/undefined_screen.dart';
import 'package:flutter/material.dart';
import 'package:bona_blog/utilities/route_constants.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomeScreenRoute:
      return MaterialPageRoute(builder: (BuildContext context) => HomeScreen());
      break;

    default:
      String name = routeSettings.arguments;
      return MaterialPageRoute(
          builder: (BuildContext context) => UndefinedScreen(name: name));
  }
}