import 'package:flutter/cupertino.dart';

class Article {
  String title;
  String imageURL;
  String category;
  String body;
  int numberOfViews;
  int numberOfWords;
  int readTime;
  String dateCreatedOn;
  String dateUpdatedOn;
  String timeCreatedOn;
  String timeUpdatedOn;

  Article(
      {@required this.title,
      @required this.imageURL,
      @required this.category,
      @required this.body,
      @required this.numberOfViews,
      @required this.numberOfWords,
      @required this.readTime,
      @required this.dateCreatedOn,
      @required this.dateUpdatedOn,
      @required this.timeCreatedOn,
      @required this.timeUpdatedOn})
      : assert(title != null),
        assert(imageURL != null),
        assert(category != null),
        assert(body != null),
        assert(numberOfViews != null),
        assert(numberOfWords != null),
        assert(readTime != null),
        assert(dateCreatedOn != null),
        assert(dateUpdatedOn != null),
        assert(timeCreatedOn != null),
        assert(timeUpdatedOn != null);

  @override
  String toString() => "$title";
}
