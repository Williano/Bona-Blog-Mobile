import 'package:bona_blog/data/models/article_models/article_model.dart';
import 'package:bona_blog/data/models/category_models/category_model.dart';
import 'package:bona_blog/ui/screens/category/category_articles_list_screen/category_articles_list_screen.dart';
import 'package:bona_blog/utils/routes/route_constants_utils.dart';
import 'package:bona_blog/utils/widgets/app_bar_widgets/custom_app_bar_widget.dart';
import 'package:bona_blog/utils/widgets/list_widgets/article_list_widget.dart';
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
      appBar:
          customAppBar(context: context, showBackArrow: false, title: "Feed"),
      body: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(left: 12.0, bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    _customTitle(context: context, title: "Categories"),
                  ],
                )),
            Container(
                height: 130.0,
                // color: Theme.of(context).backgroundColor,
                child: _horizontalCategoriesListBuilder(context: context)),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: Row(
                children: <Widget>[
                  _customTitle(context: context, title: "Latest Articles"),
                ],
              ),
            ),
            Expanded(
              child: articleListView(context: context, articles: _articles),
            )
          ],
        ),
      ),
    );
  }

  Widget _customTitle(
      {@required BuildContext context, @required String title}) {
    return Text(
      "$title",
      style: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.bold, wordSpacing: 1.5),
    );
  }

  Widget _horizontalCategoriesListBuilder({@required BuildContext context}) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        itemCount: _categories.length,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int categoryIndex) {
          return _onCategoryTapped(
              context: context, categoryIndex: categoryIndex);
        });
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
        child: _categoryCard(context: context, categoryIndex: categoryIndex));
  }

  Widget _categoryCard({BuildContext context, int categoryIndex}) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: Stack(
        overflow: Overflow.clip,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image(
              height: 120.0,
              width: 120.0,
              image: AssetImage("${_categories[categoryIndex].imageURL}"),
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Theme.of(context).primaryColorDark.withOpacity(0.7)),
          ),
          Positioned(
            top: 20.0,
            left: 3.0,
            right: 3.0,
            bottom: 20.0,
            child: Center(
              child: Text(
                "${_categories[categoryIndex].name}",
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColorLight,
                    fontSize: 18.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _categoryCard({BuildContext context, int categoryIndex}) {
  //   return Card(
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
  //     child: Stack(
  //       overflow: Overflow.clip,
  //       children: <Widget>[
  //         ClipRRect(
  //           borderRadius: BorderRadius.circular(8.0),
  //           child: Image(
  //             height: 120.0,
  //             width: 120.0,
  //             image: AssetImage("${_categories[categoryIndex].imageURL}"),
  //             fit: BoxFit.fill,
  //           ),
  //         ),
  //         Container(
  //           width: 120.0,
  //           decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(8.0),
  //               color: Theme.of(context).primaryColorDark.withOpacity(0.7)),
  //         ),
  //         Positioned(
  //           top: 20.0,
  //           left: 3.0,
  //           right: 3.0,
  //           bottom: 20.0,
  //           child: Center(
  //             child: Text(
  //               "${_categories[categoryIndex].name}",
  //               textAlign: TextAlign.center,
  //               maxLines: 2,
  //               overflow: TextOverflow.ellipsis,
  //               style: TextStyle(
  //                   fontWeight: FontWeight.w400,
  //                   color: Theme.of(context).primaryColorLight,
  //                   fontSize: 18.0),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
