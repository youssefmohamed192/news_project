import 'package:flutter/material.dart';
import 'package:news_project/data/api/api_manager.dart';
import 'package:news_project/data/model/SourcesResponse.dart';
import 'package:news_project/ui/screens/home/tabs/news/news_list/news_list.dart';
import 'package:news_project/ui/utils/app_colors.dart';
import 'package:news_project/ui/utils/app_theme.dart';

class NewsTab extends StatefulWidget {
  final String categoryID;
  const NewsTab({super.key, required this.categoryID});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSources(widget.categoryID),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return buildTabs(snapShot.data!);
          } else if (snapShot.hasError) {
            return Text(snapShot.error.toString());
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget buildTabs(List<Source> list) {
    return DefaultTabController(
      length: list.length,
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          TabBar(
              onTap: (index) {
                currentTabIndex = index;
                setState(() {});
              },
              indicatorColor: AppColors.transparent,
              isScrollable: true,
              tabs: list
                  .map((source) => buildTabWidget(source.name ?? "",
                      currentTabIndex == list.indexOf(source)))
                  .toList()),
          Expanded(
            child: TabBarView(
                children: list
                    .map((source) => NewsList(sourceID: source.id!))
                    .toList()),
          )
        ],
      ),
    );
  }

  Widget buildTabWidget(String name, bool isSelected) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : AppColors.transparent,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: AppColors.primary,
              width: 3
            )),
        child: Text(
          name,
          style: AppTheme.tabBarTextStyle.copyWith(
              color: isSelected ? AppColors.white : AppColors.primary),
        ));
  }
}
