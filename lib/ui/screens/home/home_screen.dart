import 'package:flutter/material.dart';
import 'package:news_project/data/model/category_dm.dart';
import 'package:news_project/ui/screens/home/tabs/categories/categories_tab.dart';
import 'package:news_project/ui/screens/home/tabs/news/news_tab.dart';
import 'package:news_project/ui/screens/home/tabs/settings/settings_tab.dart';
import 'package:news_project/ui/utils/app_assets.dart';
import 'package:news_project/ui/utils/app_colors.dart';

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
    super.initState();
    currentTab = CategoriesTab(onCategoryClick: onCategoryClick);
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () {
        if (currentTab is! CategoriesTab) {
          currentTab = CategoriesTab(onCategoryClick: onCategoryClick);
          setState(() {});
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("News App"),
        ),
        drawer: buildDrawer(context),
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
      ),
    );
  }

  onCategoryClick(CategoryDM categoryDM) {
    currentTab = NewsTab(
      categoryID: categoryDM.id,
    );
    setState(() {});
  }

  buildDrawer(BuildContext context) => Drawer(
    width: MediaQuery.of(context).size.width * .8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(color: AppColors.primary),
                child: Center(
                    child: Text(
                  "News App!",
                  style: Theme.of(context).textTheme.headlineLarge,
                ))),
            const SizedBox(height: 26,),
            buildDrawerRow(AppAssets.listIcon, "Categories", (){
              currentTab = CategoriesTab(onCategoryClick: onCategoryClick);
              setState(() {});
              Navigator.pop(context);
            }),
            const SizedBox(height: 22,),
            buildDrawerRow(AppAssets.settingsIcon, "Settings", (){
              currentTab = SettingsTab();
              setState(() {});
              Navigator.pop(context);
            })
          ],
        ),
      );
  buildDrawerRow(String imagePath, String title, Function onClick) => InkWell(
    onTap: (){
      onClick();
    },
    child: Row(
      children: [
        const SizedBox(width: 16,),
        ImageIcon(AssetImage(imagePath)),
        const SizedBox(width: 16,),
        Text(title, style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColors.black),),
      ],
    ),
  );
}
