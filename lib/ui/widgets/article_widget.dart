import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_project/data/model/ArticlesResponse.dart';
import 'package:news_project/ui/widgets/loading_widget.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;

  const ArticleWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              height: size.height * .26,
              imageUrl: article.urlToImage!,
              placeholder: (_, __) => const LoadingWidget(),
              errorWidget: (_, __, ___) => const Icon(Icons.error_outline),
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 8,),
          Text(article.source?.name ?? "", style: Theme.of(context).textTheme.bodySmall,),
          const SizedBox(height: 4,),
          Text(article.title ?? "", style: Theme.of(context).textTheme.bodyLarge,),
          Text(
            article.publishedAt ?? "",
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}
