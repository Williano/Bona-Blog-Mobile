import 'package:bona_blog/models/category_models/category_model.dart';
import 'package:bona_blog/screens/article_screens/feed_screen/category_card_widget.dart';
import 'package:bona_blog/screens/category_screens/category_articles_list_screen/category_articles_list_screen.dart';
import 'package:bona_blog/utils/routes/route_constants_utils.dart';
import 'package:bona_blog/widgets/sliver_widgets/static_sliver_app_widget.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({Key key}) : super(key: key);
  @override
  _CategoryListScreenState createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  List<ArticleCategory> _categories;

  @override
  void initState() {
    super.initState();
    _categories = ArticleCategory.getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          StaticSliverAppBar(
              title: "Categories", assetImage: "assets/images/food.jpg"),
          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int categoryIndex) {
                return _onCategoryTapped(
                    context: context, categoryIndex: categoryIndex);
              }, childCount: _categories.length),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2))
        ],
      ),
    );
  }

  Widget _onCategoryTapped({BuildContext context, int categoryIndex}) {
    return GestureDetector(
        onTap: () {
          Map<String, dynamic> data = {
            "categoryName": _categories[categoryIndex].name,
            "categoryImageURL": _categories[categoryIndex].imageURL,
          };

          pushNewScreenWithRouteSettings(context,
              screen: CateoryArticlesListScreen(
                categoryName: data["categoryName"],
                categoryImageURL: data["categoryImageURL"],
              ),
              settings: RouteSettings(name: CategoryArticlesListRoute));
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
          child: CategoryCard(
              categories: _categories, categoryIndex: categoryIndex),
        ));
  }
}
