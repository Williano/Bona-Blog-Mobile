import 'package:bona_blog/models/article_models/article_model.dart';
import 'package:bona_blog/utils/widgets/card_widgets/article_card_widget.dart';
import 'package:bona_blog/utils/widgets/sliver_widgets/dynamic_sliver_app_bar_widget.dart';
import 'package:flutter/material.dart';

class CateoryArticlesListScreen extends StatefulWidget {
  final String categoryName;
  final String categoryImageURL;

  const CateoryArticlesListScreen(
      {Key key, @required this.categoryName, @required this.categoryImageURL})
      : super(key: key);

  @override
  _CateoryArticlesListScreenState createState() =>
      _CateoryArticlesListScreenState();
}

class _CateoryArticlesListScreenState extends State<CateoryArticlesListScreen> {
  Map<String, dynamic> _categoryData;
  List<Article> _articles;

  @override
  void initState() {
    _categoryData = {
      "categoryName": widget.categoryName,
      "categoryImageURL": widget.categoryImageURL
    };
    _articles = Article.getAllArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          DynamicSliverAppBar(
              title: _categoryData["categoryName"],
              assetImage: _categoryData["categoryImageURL"]),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (BuildContext context, int articleIndex) {
              return ArticleCard(
                  articleAuthor: _articles[articleIndex].author,
                  articleTitle: _articles[articleIndex].title,
                  articleCategory: _articles[articleIndex].category,
                  articleImageUrl: _articles[articleIndex].imageURL,
                  articleDatePublishedOn:
                      _articles[articleIndex].datePublishedOn,
                  articleReadTime: _articles[articleIndex].readTime,
                  articleNumberOfViews: _articles[articleIndex].numberOfViews);
            },
            childCount: _articles.length,
          )),
        ],
      ),
    );
  }
}
