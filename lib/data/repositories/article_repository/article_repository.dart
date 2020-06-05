import 'package:bona_blog/models/category_models/category_model.dart';
import 'package:meta/meta.dart';
import 'package:bona_blog/data/repositories/base_repository.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

class ArticleRepository implements BonaBlogBaseRepository {
  final DataConnectionChecker connectionChecker;
  final dynamic articleRemoteApiClient;
  final dynamic articleLocalApiClient;

  const ArticleRepository(
      {@required this.connectionChecker,
      @required this.articleRemoteApiClient,
      this.articleLocalApiClient});

  Future<ArticleCategoryModel> createArticle(Map articleData) {}

  @override
  List<Object> get props => [];

  @override
  bool get stringify => null;
}
