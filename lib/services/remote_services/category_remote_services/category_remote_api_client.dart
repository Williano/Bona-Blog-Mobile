import 'dart:convert';

import 'package:bona_blog/models/article_models/article_model.dart';
import 'package:bona_blog/models/category_models/category_model.dart';
import 'package:bona_blog/utils/dummy_data/article_dummy_data.dart';
import 'package:bona_blog/utils/dummy_data/category_dummy_data.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import '../config.dart';

class CategoryApiClient {
  static const baseUrl = remoteApiBaseURL;
  final http.Client httpClient;

  const CategoryApiClient({@required this.httpClient});

  Future<List<ArticleCategoryModel>> getAllCategories() async {
    // final getAllcategoriesUrl = "$baseUrl/";
    // final http.Response apiResponse =
    //     await this.httpClient.get(getAllcategoriesUrl, headers: headers);

    // if (apiResponse.statusCode != 200) {
    //   throw Exception('error getting categories!');
    // }

    // final articlesJson = jsonDecode(apiResponse.body);
    // await Future.delayed(Duration(seconds: 4));
    await Future.delayed(Duration(seconds: 3));
    return dummyGetAllCategories();
  }

  Future<List<ArticleModel>> getCategoryArticles({int categoryId}) async {
    // final categoryArticlesUrl = "$baseUrl/$categoryId";
    // final http.Response apiResponse =
    //     await this.httpClient.get(categoryArticlesUrl, headers: headers);

    // if (apiResponse.statusCode != 200) {
    //   throw Exception('error getting article detail!');
    // }

    // final articleJson = jsonDecode(apiResponse.body);
    await Future.delayed(Duration(seconds: 5));
    return dummyGetAllArticles();
  }
}
