import 'package:bona_blog/utils/widgets/card_widgets/article_card_widget.dart';
import 'package:flutter/material.dart';

Widget articleListView(
    {@required BuildContext context, @required List articles}) {
  return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int articleIndex) {
        return GestureDetector(
            onTap: () {
              print("Tab");
            },
            child: ArticleCard(
                articleAuthor: articles[articleIndex].author,
                articleTitle: articles[articleIndex].title,
                articleCategory: articles[articleIndex].category,
                articleImageUrl: articles[articleIndex].imageURL,
                articleDatePublishedOn: articles[articleIndex].datePublishedOn,
                articleReadTime: articles[articleIndex].readTime,
                articleNumberOfViews: articles[articleIndex].numberOfViews));
      });
}
