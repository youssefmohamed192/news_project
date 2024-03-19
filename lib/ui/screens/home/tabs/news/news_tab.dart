import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_project/data/repos/news_repo/data_sources/online_data_source.dart';
import 'package:news_project/data/model/SourcesResponse.dart';
import 'package:news_project/ui/screens/home/tabs/news/news_list/news_list.dart';
import 'package:news_project/ui/screens/home/tabs/news/news_tab_view_model.dart';
import 'package:news_project/ui/utils/app_colors.dart';
import 'package:news_project/ui/utils/app_theme.dart';
import 'package:news_project/ui/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class NewsTab extends StatefulWidget {
  final String categoryID;

  const NewsTab({super.key, required this.categoryID});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  int currentTabIndex = 0;
  NewsTabViewModel viewModel = NewsTabViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.getSource(widget.categoryID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => viewModel,
        child: Consumer<NewsTabViewModel>(
            builder: (context, viewModel, _){
              Widget currentView;
              if (viewModel.isLoading) {
                currentView = const LoadingWidget();
              } else if (viewModel.sources.isNotEmpty) {
                currentView = buildTabs(viewModel.sources);
              } else {
                currentView = ErrorWidget(viewModel.errorMessage ??
                    "Something went wrong please try again later!");
              }
              return currentView;
            },));
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
            border: Border.all(color: AppColors.primary, width: 3)),
        child: Text(
          name,
          style: AppTheme.tabBarTextStyle.copyWith(
              color: isSelected ? AppColors.white : AppColors.primary),
        ));
  }
}
