import 'package:bona_blog/screens/article_screens/feed_screen/feed_screen.dart';
import 'package:bona_blog/screens/category_screens/category_articles_list_screen/category_articles_list_screen.dart';
import 'package:bona_blog/screens/category_screens/category_list_screen/category_list_screen.dart';
import 'package:bona_blog/screens/bottom_navigation_screen.dart';
import 'package:bona_blog/screens/undefined_screen.dart';
import 'package:bona_blog/utils/routes/route_constants_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomeScreenRoute:
      return CupertinoPageRoute(
          builder: (BuildContext context) => BottomNavigationScreen());
      break;

    ///
    /// Articles Routes
    ///
    case FeedScreenRoute:
      return CupertinoPageRoute(
          builder: (BuildContext context) => FeedScreen());
      break;

    /// Categories Routes
    ///
    ///
    case CategoriesScreenRoute:
      return CupertinoPageRoute(
          builder: (BuildContext context) => CategoryListScreen());
      break;

    case CategoryArticlesListRoute:
      final Map<String, dynamic> data =
          routeSettings.arguments as Map<String, dynamic>;

      final Map<String, dynamic> categoryData = {
        "categoryId": data["categoryId"],
        "categoryName": data["categoryName"],
        "categoryImageURL": data["categoryImageURL"],
      };

      return CupertinoPageRoute(
          builder: (BuildContext contetxt) => CateoryArticlesListScreen(
                categoryName: categoryData["categoryName"],
                categoryImageURL: categoryData["categoryImageURL"],
              ));
      break;

    ///
    /// Error Route
    ///
    default:
      String name = routeSettings.arguments;
      return CupertinoPageRoute(
          builder: (BuildContext context) => UndefinedScreen(name: name));
  }
}
