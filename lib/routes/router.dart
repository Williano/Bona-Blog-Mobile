import 'package:bona_blog/screens/category_articles_list_screen.dart';
import 'package:bona_blog/screens/category_list_screen.dart';
import 'package:bona_blog/screens/feed_screen.dart';
import 'package:bona_blog/screens/home_screen.dart';
import 'package:bona_blog/screens/undefined_screen.dart';
import 'package:flutter/material.dart';
import 'package:bona_blog/utilities/route_constants.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomeScreenRoute:
      return MaterialPageRoute(builder: (BuildContext context) => HomeScreen());
      break;

    case FeedScreenRoute:
      return MaterialPageRoute(builder: (BuildContext context) => FeedScreen());
      break;

    case CategoriesScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => CategoryListScreen());
      break;

    case CategoryArticlesListRoute:
      final Map<String, dynamic> data =
          routeSettings.arguments as Map<String, dynamic>;

      final Map<String, dynamic> categoryData = {
        "categoryName": data["categoryName"],
        "categoryImageURL": data["categoryImageURL"],
      };

      return MaterialPageRoute(
          builder: (BuildContext contetxt) => CateoryArticlesListScreen(
                categoryName: categoryData["categoryName"],
                categoryImageURL: categoryData["categoryImageURL"],
              ));
      break;

    default:
      String name = routeSettings.arguments;
      return MaterialPageRoute(
          builder: (BuildContext context) => UndefinedScreen(name: name));
  }
}
