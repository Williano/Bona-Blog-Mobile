import 'package:bona_blog/widgets/article_card_widget.dart';
import 'package:flutter/material.dart';

Widget customSliverList(
    {@required BuildContext context, @required List articles}) {
  return SliverList(
      delegate: SliverChildBuilderDelegate(
    (BuildContext context, int articleIndex) {
      return articleCard(
          context: context,
          articleAuthor: articles[articleIndex].author,
          articleTitle: articles[articleIndex].title,
          articleCategory: articles[articleIndex].category,
          articleImageUrl: articles[articleIndex].imageURL,
          articleDatePublishedOn: articles[articleIndex].datePublishedOn,
          articleReadTime: articles[articleIndex].readTime,
          articleNumberOfViews: articles[articleIndex].numberOfViews);
    },
    childCount: articles.length,
  ));
}
