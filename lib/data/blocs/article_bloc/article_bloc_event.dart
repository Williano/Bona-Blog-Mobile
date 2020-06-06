part of 'article_bloc.dart';

abstract class ArticleEvent extends Equatable {
  const ArticleEvent();
}

class GetArticlesEvent extends ArticleEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    String status = "Articles retrieved";
    return status;
  }
}

class GetArticleDetailEvent extends ArticleEvent {
  final int articleId;

  const GetArticleDetailEvent({@required this.articleId});

  @override
  List<Object> get props => [articleId];

  @override
  String toString() {
    String status = "Article Detailed retrieved";
    return status;
  }
}

class CreateArticleEvent extends ArticleEvent {
  final Map articleData;

  const CreateArticleEvent({@required this.articleData});

  @override
  List<Object> get props => [articleData];

  @override
  String toString() {
    String status = "Article Created";
    return status;
  }
}

class UpdateArticleEvent extends ArticleEvent {
  final int articleId;
  final Map newArticleData;

  const UpdateArticleEvent({@required this.articleId, this.newArticleData});

  @override
  List<Object> get props => [articleId, newArticleData];

  @override
  String toString() {
    String status = "Article Updated";
    return status;
  }
}

class DeleteArticleEvent extends ArticleEvent {
  final int articleId;

  const DeleteArticleEvent({@required this.articleId});

  @override
  List<Object> get props => [articleId];

  @override
  String toString() {
    String status = "Article Deleted";
    return status;
  }
}

class BookmarkArticleEvent extends ArticleEvent {
  final int articleId;
  final String username;

  const BookmarkArticleEvent({@required this.articleId, this.username});

  @override
  List<Object> get props => [articleId, username];

  @override
  String toString() {
    String status = "Article Bookmarked";
    return status;
  }
}
