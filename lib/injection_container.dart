import 'package:bona_blog/features/article/bloc/article_bloc.dart';
import 'package:bona_blog/features/article/data/repository/article_repository.dart';
import 'package:bona_blog/features/category/data/repository/category_repository.dart';
import 'package:bona_blog/features/article/data/service/article_service.dart';
import 'package:bona_blog/features/category/bloc/category_bloc.dart';
import 'package:bona_blog/features/category/data/services/category_remote_api_client.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final servicelocator = GetIt.instance;

Future<void> init() async {
  // Bloc
  servicelocator
      .registerFactory(() => ArticleBloc(articleRepository: servicelocator()));

  servicelocator.registerFactory(
      () => CategoryBloc(categoryRepository: servicelocator()));

  // Repository
  servicelocator.registerLazySingleton<ArticleRepository>(() =>
      ArticleRepository(
          articleRemoteApiClient: servicelocator(),
          connectionChecker: servicelocator()));
  servicelocator.registerLazySingleton<CategoryRepository>(() =>
      CategoryRepository(
          categoryRemoteApiClient: servicelocator(),
          connectionChecker: servicelocator()));

  // ApiClient
  servicelocator.registerLazySingleton<ArticleApiClient>(
      () => ArticleApiClient(httpClient: servicelocator()));
  servicelocator.registerLazySingleton<CategoryApiClient>(
      () => CategoryApiClient(httpClient: servicelocator()));

  servicelocator.registerLazySingleton(() => http.Client());
  servicelocator.registerLazySingleton(() => DataConnectionChecker());
}
