import 'package:bona_blog/features/article/bloc/article_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArticleCard extends StatefulWidget {
  final int articleId;
  final String articleAuthor;
  final String articleTitle;
  final String articleCategory;
  final String articleImageUrl;
  final String articleDatePublishedOn;
  final int articleReadTime;
  final int articleNumberOfViews;

  const ArticleCard(
      {Key key,
      @required this.articleId,
      @required this.articleAuthor,
      @required this.articleTitle,
      @required this.articleCategory,
      @required this.articleImageUrl,
      @required this.articleDatePublishedOn,
      @required this.articleReadTime,
      @required this.articleNumberOfViews})
      : super(key: key);

  @override
  _ArticleCardState createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  @override
  Widget build(BuildContext context) {
    int articleId = widget.articleId;
    String articleAuthor = widget.articleAuthor;
    String articleTitle = widget.articleTitle;
    String articleCategory = widget.articleCategory;
    String articleImageUrl = widget.articleImageUrl;
    String articleDatePublishedOn = widget.articleDatePublishedOn;
    int articleReadTime = widget.articleReadTime;
    int articleNumberOfViews = widget.articleNumberOfViews;

    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: Card(
          elevation: 5.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image(
                    width: 100.0,
                    height: 100.0,
                    image: AssetImage(articleImageUrl),
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 1.0, 1.0, 1.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            articleCategory.toUpperCase(),
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 2.0, bottom: 8.0),
                            child: Text(
                              articleTitle,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 1.5),
                                        child: Text(
                                          "By",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 11.0),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          articleAuthor,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.4),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  articleDatePublishedOn,
                                  style: TextStyle(fontSize: 11.0),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            height: 0.0,
                            thickness: 1.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(children: <Widget>[
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          right: 2.0, bottom: 1.0),
                                      child: FaIcon(
                                        FontAwesomeIcons.solidClock,
                                        size: 12.0,
                                      )),
                                  Text(
                                    "$articleReadTime min read",
                                    style: TextStyle(fontSize: 12.0),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ]),
                                Row(children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 2.0),
                                    child: FaIcon(
                                      FontAwesomeIcons.solidEye,
                                      size: 12.0,
                                    ),
                                  ),
                                  Text(
                                    "$articleNumberOfViews",
                                    style: TextStyle(fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ]),
                                Row(children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      final articleBloc =
                                          BlocProvider.of<ArticleBloc>(context);
                                      articleBloc.add(BookmarkArticleEvent(
                                          articleId: articleId));
                                    },
                                    child: FaIcon(
                                      FontAwesomeIcons.bookmark,
                                      size: 14.0,
                                    ),
                                  )
                                ]),
                              ],
                            ),
                          )
                        ]),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
