import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_project/data/model/SourcesResponse.dart';
import 'package:news_project/data/repos/news_repo/data_sources/offline_data_source.dart';
import 'package:news_project/data/repos/news_repo/data_sources/online_data_source.dart';

class NewsRepo {
  OfflineDataSource offlineDataSource;
  OnlineDataSource onlineDataSource;

  NewsRepo(this.onlineDataSource, this.offlineDataSource);

  Future<SourcesResponse?> getSources(String categoryID) async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      SourcesResponse response = await onlineDataSource.getSources(categoryID);
      offlineDataSource.saveSources(response, categoryID);
      return response;
    } else {
      return await offlineDataSource.getSource(categoryID);
    }
  }
}
