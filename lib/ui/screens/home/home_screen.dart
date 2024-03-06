import 'package:flutter/material.dart';
import 'package:news_project/data/model/category_dm.dart';
import 'package:news_project/ui/screens/home/tabs/categories/categories_tab.dart';
import 'package:news_project/ui/screens/home/tabs/news/news_tab.dart';
import 'package:news_project/ui/utils/app_assets.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget currentTab;

  @override
  void initState() {
    // TODO: implement initState
    currentTab = CategoriesTab(onCategoryClick: onCategoryClick);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
      ),
      body: Stack(
        children: [
          Image.asset(
            AppAssets.backgroundImage,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          currentTab,
        ],
      ),
    );
  }

  onCategoryClick(CategoryDM categoryDM) {
    currentTab = NewsTab(categoryID: categoryDM.id,);
    setState(() {});
  }
}
