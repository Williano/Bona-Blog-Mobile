part of 'article_bloc.dart';

abstract class ArticleState extends Equatable {
  const ArticleState();
}

class ArticleEmpty extends ArticleState {
  @override
  List<Object> get props => [];
}

class ArticleLoading extends ArticleState {
  @override
  List<Object> get props => [];
}

class ArticlesLoaded extends ArticleState {
  final List<ArticleModel> articles;

  const ArticlesLoaded({@required this.articles});

  @override
  List<Object> get props => [articles];
}

class ArticleLoaded extends ArticleState {
  final ArticleModel article;

  const ArticleLoaded({@required this.article});

  @override
  List<Object> get props => [article];
}

class ArticleSuccess extends ArticleState {
  final String message;

  const ArticleSuccess({@required this.message});

  @override
  List<Object> get props => [];
}

class ArticleError extends ArticleState {
  final String errorMessage;
  const ArticleError({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
