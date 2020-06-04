import 'package:bona_blog/ui/screens/category_screens/category_articles_list_screen/category_articles_list_screen.dart';
import 'package:bona_blog/ui/screens/category_screens/category_list_screen/category_list_screen.dart';
import 'package:bona_blog/ui/screens/feed_screen.dart';
import 'package:bona_blog/ui/screens/home_screen.dart';
import 'package:bona_blog/ui/screens/undefined_screen.dart';
import 'package:bona_blog/utils/routes/route_constants_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomeScreenRoute:
      return CupertinoPageRoute(
          builder: (BuildContext context) => HomeScreen());
      break;

    case FeedScreenRoute:
      return CupertinoPageRoute(
          builder: (BuildContext context) => FeedScreen());
      break;

    case CategoriesScreenRoute:
      return CupertinoPageRoute(
          builder: (BuildContext context) => CategoryListScreen());
      break;

    case CategoryArticlesListRoute:
      final Map<String, dynamic> data =
          routeSettings.arguments as Map<String, dynamic>;

      final Map<String, dynamic> categoryData = {
        "categoryName": data["categoryName"],
        "categoryImageURL": data["categoryImageURL"],
      };

      return CupertinoPageRoute(
          builder: (BuildContext contetxt) => CateoryArticlesListScreen(
                categoryName: categoryData["categoryName"],
                categoryImageURL: categoryData["categoryImageURL"],
              ));
      break;

    default:
      String name = routeSettings.arguments;
      return CupertinoPageRoute(
          builder: (BuildContext context) => UndefinedScreen(name: name));
  }
}
