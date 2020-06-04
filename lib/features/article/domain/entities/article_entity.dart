import 'package:bona_blog/core/entity/base_entity.dart';
import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable implements BaseEntity {
  final int articleId;
  final String author;
  final String title;
  final String imageURL;
  final String category;
  final String body;
  final int numberOfViews;
  final int readTime;
  final String datePublishedOn;
  final String dateUpdatedOn;
  final String timePublishedOn;
  final String timeUpdatedOn;

  ArticleEntity(
      {this.articleId,
      this.author,
      this.title,
      this.imageURL,
      this.category,
      this.body,
      this.numberOfViews,
      this.readTime,
      this.datePublishedOn,
      this.dateUpdatedOn,
      this.timePublishedOn,
      this.timeUpdatedOn})
      : assert(articleId != null),
        assert(author != null),
        assert(title != null),
        assert(imageURL != null),
        assert(category != null),
        assert(body != null),
        assert(numberOfViews != null),
        assert(readTime != null);
  // assert(dateCreatedOn != null),
  // assert(dateUpdatedOn != null),
  // assert(timeCreatedOn != null),
  // assert(timeUpdatedOn != null);

  @override
  String toString() => "$title";

  @override
  List<Object> get props => [
        articleId,
        author,
        title,
        imageURL,
        category,
        body,
        numberOfViews,
        readTime,
        datePublishedOn,
        dateUpdatedOn,
        timePublishedOn,
        timeUpdatedOn
      ];
}
