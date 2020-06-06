import 'package:bona_blog/models/article_models/article_model.dart';
import 'package:bona_blog/screens/article_screens/feed_screen/article_card_widget.dart';
import 'package:flutter/material.dart';

class DisplayArticlesWidget extends StatelessWidget {
  final List<ArticleModel> articles;

  const DisplayArticlesWidget({
    Key key,
    @required this.articles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: articles.length,
        itemBuilder: (BuildContext context, int articleIndex) {
          return GestureDetector(
              onTap: () {
                print("Tap");
              },
              child: ArticleCard(
                  articleId: articles[articleIndex].articleId,
                  articleAuthor: articles[articleIndex].author,
                  articleTitle: articles[articleIndex].title,
                  articleCategory: articles[articleIndex].category,
                  articleImageUrl: articles[articleIndex].imageURL,
                  articleDatePublishedOn:
                      articles[articleIndex].datePublishedOn,
                  articleReadTime: articles[articleIndex].readTime,
                  articleNumberOfViews: articles[articleIndex].numberOfViews));
        });
  }
}
