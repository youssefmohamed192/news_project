import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_project/data/model/ArticlesResponse.dart';
import 'package:news_project/data/model/SourcesResponse.dart';

class OnlineDataSource {
  static const String baseUrl = "newsapi.org";
  static const sourcesEndPoint = "/v2/top-headlines/sources";
  static const articlesEndPoint = "/v2/everything";
  static const String apiKey = "3d03b8562f86476ab7756e091312ef2c";

  Future<SourcesResponse> getSources(String category) async {
    Uri url = Uri.parse(
        "https://$baseUrl$sourcesEndPoint?apiKey=$apiKey&category=$category");
    Response response = await get(url);
    Map json = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    if (response.statusCode >= 200 &&
        response.statusCode < 300 &&
        sourcesResponse.sources?.isNotEmpty == true) {
      return sourcesResponse;
    }
    throw Exception(sourcesResponse.message);
  }

  Future<List<Article>> getArticles(String sourceID) async {
    Uri url = Uri.https(
        baseUrl, articlesEndPoint, {"apiKey": apiKey, "sources": sourceID});
    Response serverResponse = await get(url);
    Map json = jsonDecode(serverResponse.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    if (serverResponse.statusCode >= 200 &&
        serverResponse.statusCode < 300 &&
        articlesResponse.articles?.isNotEmpty == true) {
      return articlesResponse.articles!;
    }
    throw Exception("Something went wrong please try again later!");
  }
}
