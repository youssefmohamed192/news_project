import 'package:flutter/material.dart';
import 'package:news_project/data/api/api_manager.dart';
import 'package:news_project/data/model/ArticlesResponse.dart';
import 'package:news_project/ui/widgets/article_widget.dart';
import 'package:news_project/ui/widgets/error_view.dart';
import 'package:news_project/ui/widgets/loading_widget.dart';

class NewsList extends StatelessWidget {
  final String sourceID;
  const NewsList({super.key, required this.sourceID});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getArticles(sourceID),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return buildArticlesListView(snapshot.data!);
          }else if(snapshot.hasError){
            return ErrorView(message: snapshot.error.toString());
          }else{
            return const LoadingWidget();
          }
        });
  }

  Widget buildArticlesListView(List<Article> articles) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index){
          return ArticleWidget(article: articles[index]);
        });
  }
}
