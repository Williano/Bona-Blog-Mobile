import 'package:bona_blog/models/category_models/category_model.dart';
import 'package:bona_blog/screens/article_screens/feed_screen/feed_category_card_widget.dart';
import 'package:bona_blog/screens/category_screens/category_articles_list_screen/category_articles_list_screen.dart';
import 'package:bona_blog/utils/routes/route_constants_utils.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.widget.dart';

class DisplayCategoriesWidget extends StatelessWidget {
  final List<ArticleCategoryModel> categories;

  const DisplayCategoriesWidget({
    Key key,
    @required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        itemCount: categories.length,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int categoryIndex) {
          return GestureDetector(
              onTap: () {
                Map<String, dynamic> data = {
                  "categoryName": categories[categoryIndex].name,
                  "categoryImageURL": categories[categoryIndex].imageURL,
                };

                pushNewScreenWithRouteSettings(context,
                    screen: CateoryArticlesListScreen(
                      categoryName: data["categoryName"],
                      categoryImageURL: data["categoryImageURL"],
                    ),
                    settings: RouteSettings(name: CategoryArticlesListRoute));
              },
              child: FeedCategoryCard(
                  categories: categories, categoryIndex: categoryIndex));
        });
  }
}
