import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget articleCard(
    {@required BuildContext context,
    @required String articleAuthor,
    @required String articleTitle,
    @required String articleCategory,
    @required String articleImageUrl,
    @required String articleDatePublishedOn,
    @required int articleReadTime,
    @required int articleNumberOfViews}) {
  return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
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
                image: AssetImage("$articleImageUrl"),
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
                        "$articleCategory".toUpperCase(),
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                            fontSize: 13.0),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0, bottom: 8.0),
                        child: Text(
                          "$articleTitle",
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
                            Padding(
                              padding: const EdgeInsets.only(bottom: 3.0),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 4.0),
                                    child: Text(
                                      "By",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 13),
                                    ),
                                  ),
                                  Text(
                                    "$articleAuthor",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.4),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "$articleDatePublishedOn",
                              style: TextStyle(fontSize: 12),
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
                                    size: 13.0,
                                  )),
                              Text(
                                "$articleReadTime min read",
                                style: TextStyle(fontSize: 13),
                              ),
                            ]),
                            Row(children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 2.0),
                                child: FaIcon(
                                  FontAwesomeIcons.solidEye,
                                  size: 13.0,
                                ),
                              ),
                              Text(
                                "$articleNumberOfViews",
                                style: TextStyle(fontSize: 13),
                              ),
                            ]),
                            Row(children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  print("$articleTitle bookmarked");
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
      ));
}
