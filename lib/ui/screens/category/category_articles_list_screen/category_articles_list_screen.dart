import 'package:bona_blog/data/models/article_models/article_model.dart';
import 'package:bona_blog/utils/widgets/sliver_widgets/custom_sliver_list_widget.dart';
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
          dynamicSliverAppBar(
              context: context,
              title: _categoryData["categoryName"],
              assetImage: _categoryData["categoryImageURL"]),
          customSliverList(context: context, articles: _articles),
        ],
      ),
    );
  }
}
