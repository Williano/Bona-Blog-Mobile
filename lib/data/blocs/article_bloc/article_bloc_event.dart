part of 'article_bloc_bloc.dart';

abstract class ArticleEvent extends Equatable {
  const ArticleEvent();
}

class GetArticles extends ArticleEvent {
  @override
  List<Object> get props => [];
}

class GetArticleDetail extends ArticleEvent {
  final int articleId;

  const GetArticleDetail({@required this.articleId});

  @override
  List<Object> get props => [articleId];
}

class CreateArticle extends ArticleEvent {
  final Map articleData;

  const CreateArticle({@required this.articleData});

  @override
  List<Object> get props => [articleData];
}

class UpdateArticle extends ArticleEvent {
  final int articleId;
  final Map newArticleData;

  const UpdateArticle({@required this.articleId, this.newArticleData});

  @override
  List<Object> get props => [articleId, newArticleData];
}

class DeleteArticle extends ArticleEvent {
  final int articleId;

  const DeleteArticle({@required this.articleId});

  @override
  List<Object> get props => [articleId];
}

class BookmarkArticle extends ArticleEvent {
  final int articleId;
  final String username;

  const BookmarkArticle({@required this.articleId, this.username});

  @override
  List<Object> get props => [articleId, username];
}
