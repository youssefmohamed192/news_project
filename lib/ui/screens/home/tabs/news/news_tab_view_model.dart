import 'package:flutter/cupertino.dart';
import 'package:news_project/data/repos/news_repo/data_sources/offline_data_source.dart';
import 'package:news_project/data/repos/news_repo/data_sources/online_data_source.dart';
import 'package:news_project/data/model/SourcesResponse.dart';
import 'package:news_project/data/repos/news_repo/news_repo.dart';

class NewsTabViewModel extends ChangeNotifier {
  List<Source> sources = [];
  bool isLoading = false;
  String? errorMessage;
  NewsRepo newsRepo = NewsRepo(OnlineDataSource(), OfflineDataSource());

  void getSource(String categoryID) async {
    isLoading = true;
    notifyListeners();
    try {
      SourcesResponse? sourcesResponse = await newsRepo.getSources(categoryID);
      if(sourcesResponse != null && sourcesResponse.sources?.isNotEmpty == true){
        isLoading = false;
        sources = sourcesResponse.sources!;
        notifyListeners();
      }else{
        throw "SomeThing went wrong please try again later!";
      }
    } catch (e) {
      isLoading = false;
      errorMessage = e.toString();
      notifyListeners();
    }
  }
}
