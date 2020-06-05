import 'package:bona_blog/models/article_models/article_model.dart';
import 'package:bona_blog/models/category_models/category_model.dart';
import 'package:bona_blog/screens/article_screens/feed_screen/feed_category_card_widget.dart';
import 'package:bona_blog/screens/category_screens/category_articles_list_screen/category_articles_list_screen.dart';
import 'package:bona_blog/utils/routes/route_constants_utils.dart';
import 'package:bona_blog/widgets/card_widgets/article_card_widget.dart';
import 'package:bona_blog/widgets/custom_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key key}) : super(key: key);
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<Article> _articles;
  List<ArticleCategory> _categories;

  @override
  void initState() {
    _categories = ArticleCategory.getAllCategories();
    _articles = Article.getAllArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Feed",
          style: TextStyle(
              color: Theme.of(context).primaryColorLight,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(left: 12.0, bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    CustomTitle(title: "Categories"),
                  ],
                )),
            Container(
                height: 130.0,
                // color: Theme.of(context).backgroundColor,
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    itemCount: _categories.length,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int categoryIndex) {
                      return _onCategoryTapped(
                          context: context, categoryIndex: categoryIndex);
                    })),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: Row(
                children: <Widget>[
                  CustomTitle(title: "Latest Articles"),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: _articles.length,
                  itemBuilder: (BuildContext context, int articleIndex) {
                    return GestureDetector(
                        onTap: () {
                          print("Tab");
                        },
                        child: ArticleCard(
                            articleAuthor: _articles[articleIndex].author,
                            articleTitle: _articles[articleIndex].title,
                            articleCategory: _articles[articleIndex].category,
                            articleImageUrl: _articles[articleIndex].imageURL,
                            articleDatePublishedOn:
                                _articles[articleIndex].datePublishedOn,
                            articleReadTime: _articles[articleIndex].readTime,
                            articleNumberOfViews:
                                _articles[articleIndex].numberOfViews));
                  }),
            )
          ],
        ),
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
        child: FeedCategoryCard(
            categories: _categories, categoryIndex: categoryIndex));
  }
}
