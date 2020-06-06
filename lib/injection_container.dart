import 'package:bona_blog/data/blocs/article_bloc/article_bloc.dart';
import 'package:bona_blog/data/blocs/category_bloc/category_bloc.dart';
import 'package:bona_blog/data/repositories/article_repository/article_repository.dart';
import 'package:bona_blog/data/repositories/category_repository/category_repository.dart';
import 'package:bona_blog/services/remote_services/article_remote_services/article_remote_api_client.dart';
import 'package:bona_blog/services/remote_services/category_remote_services/category_remote_api_client.dart';
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
