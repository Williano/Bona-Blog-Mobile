part of 'article_bloc_bloc.dart';

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
  final List<Map> articles;

  const ArticlesLoaded({@required this.articles});

  @override
  List<Object> get props => [];
}

class ArticleLoaded extends ArticleState {
  final article;

  const ArticleLoaded({@required this.article});

  @override
  List<Object> get props => [];
}

class ArticleError extends ArticleState {
  @override
  List<Object> get props => [];
}
