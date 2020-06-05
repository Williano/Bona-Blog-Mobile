part of 'article_bloc.dart';

abstract class ArticleEvent extends Equatable {
  const ArticleEvent();
}

class GetArticlesEvent extends ArticleEvent {
  @override
  List<Object> get props => [];
}

class GetArticleDetailEvent extends ArticleEvent {
  final int articleId;

  const GetArticleDetailEvent({@required this.articleId});

  @override
  List<Object> get props => [articleId];
}

class CreateArticleEvent extends ArticleEvent {
  final Map articleData;

  const CreateArticleEvent({@required this.articleData});

  @override
  List<Object> get props => [articleData];
}

class UpdateArticleEvent extends ArticleEvent {
  final int articleId;
  final Map newArticleData;

  const UpdateArticleEvent({@required this.articleId, this.newArticleData});

  @override
  List<Object> get props => [articleId, newArticleData];
}

class DeleteArticleEvent extends ArticleEvent {
  final int articleId;

  const DeleteArticleEvent({@required this.articleId});

  @override
  List<Object> get props => [articleId];
}

class BookmarkArticleEvent extends ArticleEvent {
  final int articleId;
  final String username;

  const BookmarkArticleEvent({@required this.articleId, this.username});

  @override
  List<Object> get props => [articleId, username];
}
