import 'dart:async';
import 'package:bona_blog/data/repositories/article_repository/article_repository.dart';
import 'package:bona_blog/models/article_models/article_model.dart';
import 'package:meta/meta.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'article_bloc_event.dart';
part 'article_bloc_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ArticleRepository articleRepository;

  ArticleBloc({@required this.articleRepository});

  @override
  ArticleState get initialState => ArticleEmpty();

  @override
  Stream<ArticleState> mapEventToState(
    ArticleEvent event,
  ) async* {
    if (event is GetArticlesEvent) {
      yield* _mapGetArticlesEventToState(event);
    } else if (event is GetArticleDetailEvent) {
      yield* _mapGetArticleDetailEventToState(event);
    } else if (event is CreateArticleEvent) {
      yield* _mapCreateArticleEventToState(event);
    } else if (event is UpdateArticleEvent) {
      yield* _mapUpdateArticleEventToState(event);
    } else if (event is DeleteArticleEvent) {
      yield* _mapDeleteArticleEventToState(event);
    } else if (event is BookmarkArticleEvent) {
      yield* _mapBookmarkArticleEventToState(event);
    }
  }

  Stream<ArticleState> _mapGetArticlesEventToState(
      GetArticlesEvent event) async* {
    yield ArticleLoading();
    try {
      final List<ArticleModel> articles =
          await articleRepository.getAllArticles();
      yield ArticlesLoaded(articles: articles);
    } catch (_) {
      yield ArticleError();
    }
  }

  Stream<ArticleState> _mapGetArticleDetailEventToState(
      GetArticleDetailEvent event) async* {
    yield ArticleLoading();
    try {
      final ArticleModel article =
          await articleRepository.getArticleDetail(articleId: event.articleId);
      yield ArticleLoaded(article: article);
    } catch (_) {
      yield ArticleError();
    }
  }

  Stream<ArticleState> _mapCreateArticleEventToState(
      CreateArticleEvent event) async* {
    yield ArticleLoading();
    try {
      final ArticleModel article =
          await articleRepository.createArticle(articleData: event.articleData);
      yield ArticleLoaded(article: article);
    } catch (_) {
      yield ArticleError();
    }
  }

  Stream<ArticleState> _mapUpdateArticleEventToState(
      UpdateArticleEvent event) async* {
    yield ArticleLoading();
    try {
      final ArticleModel article = await articleRepository.updateArticle(
          articleId: event.articleId, newArticleData: event.newArticleData);
      yield ArticleLoaded(article: article);
    } catch (_) {
      yield ArticleError();
    }
  }

  Stream<ArticleState> _mapDeleteArticleEventToState(
      DeleteArticleEvent event) async* {
    yield ArticleLoading();
    try {
      final List<ArticleModel> articles =
          await articleRepository.deleteArticle(articleId: event.articleId);
      yield ArticlesLoaded(articles: articles);
    } catch (_) {
      yield ArticleError();
    }
  }

  Stream<ArticleState> _mapBookmarkArticleEventToState(
      BookmarkArticleEvent event) async* {
    yield ArticleLoading();
    try {
      final String message = await articleRepository.bookmarkArticle(
          articleId: event.articleId, username: event.username);
      yield ArticleSuccess(message: message);
    } catch (_) {
      yield ArticleError();
    }
  }
}
