import 'package:bona_blog/models/article_model.dart';
import 'package:bona_blog/models/category_model.dart';
import 'package:bona_blog/utilities/route_constants_utils.dart';
import 'package:bona_blog/widgets/article_list_widget.dart';
import 'package:bona_blog/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key key}) : super(key: key);
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<Article> _articles;
  List<Category> _categories;

  @override
  void initState() {
    _categories = Category.getAllCategories();
    _articles = Article.getAllArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar:
            customAppBar(context: context, showBackArrow: false, title: "Feed"),
        body: Container(
            color: Theme.of(context).backgroundColor,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child:
                          _customTitle(context: context, title: "Categories")),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                      height: 130.0,
                      color: Theme.of(context).backgroundColor,
                      child:
                          _horizontalCategoriesListBuilder(context: context)),
                  SizedBox(
                    height: 10.0,
                  ),
                  _customTitle(context: context, title: "Latest Articles"),
                  SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child:
                        articleListView(context: context, articles: _articles),
                  )
                ],
              ),
            )));
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
        itemCount: _categories.length,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int categoryIndex) {
          return GestureDetector(
              onTap: () {
                Map<String, dynamic> data = {
                  "categoryName": _categories[categoryIndex].name,
                  "categoryImageURL": _categories[categoryIndex].imageURL,
                };
                Navigator.pushNamed(context, CategoryArticlesListRoute,
                    arguments: data);
              },
              child: _categoryCard(
                  context: context, categoryIndex: categoryIndex));
        });
  }

  Widget _categoryCard({BuildContext context, int categoryIndex}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image(
              height: 120.0,
              width: 120.0,
              image: AssetImage("${_categories[categoryIndex].imageURL}"),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 120.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.black.withOpacity(0.7)),
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
}
