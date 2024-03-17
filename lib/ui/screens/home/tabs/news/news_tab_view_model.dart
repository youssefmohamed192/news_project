import 'package:flutter/cupertino.dart';
import 'package:news_project/data/api/api_manager.dart';
import 'package:news_project/data/model/SourcesResponse.dart';

class NewsTabViewModel extends ChangeNotifier {
  List<Source> sources = [];
  bool isLoading = false;
  String? errorMessage;

  void getSource(String categoryID) async {
    isLoading = true;
    notifyListeners();
    try {
      sources = await ApiManager.getSources(categoryID);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      errorMessage = e.toString();
      notifyListeners();
    }
  }
}
