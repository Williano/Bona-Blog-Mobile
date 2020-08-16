import 'package:bona_blog/features/article/data/model/article_model.dart';
import 'package:bona_blog/features/article/data/service/article_service.dart';
import 'package:meta/meta.dart';
import 'package:bona_blog/data/repositories/base_repository.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

class ArticleRepository implements BonaBlogBaseRepository {
  final DataConnectionChecker connectionChecker;
  final ArticleApiClient articleRemoteApiClient;
  final dynamic articleLocalApiClient;

  const ArticleRepository(
      {@required this.connectionChecker,
      @required this.articleRemoteApiClient,
      this.articleLocalApiClient});

  Future<Article> createArticle({Map articleData}) async {
    if (await connectionChecker.hasConnection) {
      final newArticle =
          await articleRemoteApiClient.createArticle(articleData: articleData);
      // insert into local db
      return newArticle;
    } else {
      throw Exception('No internet connection');
    }
  }

  Future<List<Article>> getAllArticles() async {
    if (await connectionChecker.hasConnection) {
      final articleList = await articleRemoteApiClient.getAllArticles();
      return articleList;
    } else {
      throw Exception('No internet connection');
    }
  }

  Future<Article> getArticleDetail({int articleId}) async {
    if (await connectionChecker.hasConnection) {
      final articleDetail =
          await articleRemoteApiClient.getArticleDetail(articleId: articleId);
      // insert into local db
      return articleDetail;
    } else {
      throw Exception('No internet connection');
    }
  }

  Future<List<Article>> deleteArticle({int articleId}) async {
    if (await connectionChecker.hasConnection) {
      final articleList =
          await articleRemoteApiClient.deleteArticle(articleId: articleId);
      // insert into local db
      return articleList;
    } else {
      throw Exception('No internet connection');
    }
  }

  Future<Article> updateArticle({int articleId, Map newArticleData}) async {
    if (await connectionChecker.hasConnection) {
      final articleDetail = await articleRemoteApiClient.updateArticle(
          articleId: articleId, newArticleData: newArticleData);
      // insert into local db
      return articleDetail;
    } else {
      throw Exception('No internet connection');
    }
  }

  Future<String> bookmarkArticle({int articleId, String username}) async {
    if (await connectionChecker.hasConnection) {
      final message = await articleRemoteApiClient.bookmarkArticle(
          articleId: articleId, username: username);
      // insert into local db
      return message;
    } else {
      throw Exception('No internet connection');
    }
  }

  @override
  List<Object> get props =>
      [connectionChecker, articleRemoteApiClient, articleLocalApiClient];

  @override
  bool get stringify => null;
}
