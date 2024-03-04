import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_project/data/model/SourcesResponse.dart';

abstract class ApiManager {
  static const String baseUrl = "newsapi.org";
  static const sourcesEndPoint = "/v2/top-headlines/sources";
  static const String apiKey = "3d03b8562f86476ab7756e091312ef2c";

  static Future<List<Source>> getSources() async {
    Uri url = Uri.parse("https://$baseUrl$sourcesEndPoint?apiKey=$apiKey");
    Response response = await get(url);
    Map json = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    if (response.statusCode >= 200 &&
        response.statusCode < 300 &&
        sourcesResponse.sources?.isNotEmpty == true) {
      return sourcesResponse.sources!;
    }
    throw Exception(sourcesResponse.message);
  }
}