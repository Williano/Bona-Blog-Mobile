import 'dart:convert';

import 'package:bona_blog/models/article_models/article_model.dart';
import 'package:meta/meta.dart';
import 'package:bona_blog/services/remote_services/config.dart';
import 'package:http/http.dart' as http;

class ArticleApiClient {
  static const baseUrl = remoteApiBaseURL;
  final http.Client httpClient;

  const ArticleApiClient({@required this.httpClient});

  Future<ArticleModel> createArticle({Map articleData}) async {
    final createArticleUrl = "$baseUrl/";
    final http.Response apiResponse = await this
        .httpClient
        .post(createArticleUrl, headers: headers, body: articleData);

    if (apiResponse.statusCode != 200) {
      throw Exception('error creating article!');
    }

    final articleJson = jsonDecode(apiResponse.body);
    return null;
  }

  Future<List<ArticleModel>> getAllArticles() async {
    final createArticleUrl = "$baseUrl/";
    final http.Response apiResponse =
        await this.httpClient.get(createArticleUrl, headers: headers);

    if (apiResponse.statusCode != 200) {
      throw Exception('error getting articles!');
    }

    final articlesJson = jsonDecode(apiResponse.body);
    return getAllArticles();
  }

  Future<ArticleModel> getArticleDetail({int articleId}) async {
    final createArticleUrl = "$baseUrl/$articleId";
    final http.Response apiResponse =
        await this.httpClient.get(createArticleUrl, headers: headers);

    if (apiResponse.statusCode != 200) {
      throw Exception('error getting article detail!');
    }

    final articleJson = jsonDecode(apiResponse.body);
    return null;
  }

  Future<List<ArticleModel>> deleteArticle({int articleId}) async {
    final createArticleUrl = "$baseUrl/$articleId";
    final http.Response apiResponse =
        await this.httpClient.post(createArticleUrl, headers: headers);

    if (apiResponse.statusCode != 200) {
      throw Exception('error deleting article!');
    }

    final articlesJson = jsonDecode(apiResponse.body);
    return null;
  }

  Future<ArticleModel> updateArticle(
      {int articleId, Map newArticleData}) async {
    final createArticleUrl = "$baseUrl/$articleId";
    final http.Response apiResponse = await this
        .httpClient
        .post(createArticleUrl, headers: headers, body: newArticleData);

    if (apiResponse.statusCode != 200) {
      throw Exception('error updating article!');
    }

    final articleJson = jsonDecode(apiResponse.body);
    return null;
  }

  Future<String> bookmarkArticle({int articleId, String username}) async {
    final createArticleUrl = "$baseUrl/$articleId";
    final Map data = {"articleId": articleId, "username": username};
    final http.Response apiResponse = await this
        .httpClient
        .post(createArticleUrl, headers: headers, body: data);

    if (apiResponse.statusCode != 200) {
      throw Exception('error creating article!');
    }

    final response = jsonDecode(apiResponse.body);
    return null;
  }
}
