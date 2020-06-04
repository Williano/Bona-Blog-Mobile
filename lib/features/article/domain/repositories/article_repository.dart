import 'package:bona_blog/core/error/failures_error.dart';
import 'package:bona_blog/features/article/domain/entities/article_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ArticleRepository {
  Future<Either<Failure, ArticleEntity>> createArticle(Map articleData);
  Future<Either<Failure, ArticleEntity>> getAllArticles();
  Future<Either<Failure, ArticleEntity>> getArticleDetail(int articleId);
  Future<Either<Failure, ArticleEntity>> deleteArticle(int articleId);
  Future<Either<Failure, ArticleEntity>> updateArticle(
      int articleId, Map newArticleData);
  Future<Either<Failure, String>> bookmarkArticle(
      int articleId, String username);
}
