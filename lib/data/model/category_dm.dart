import 'package:flutter/material.dart';
import 'package:news_project/ui/utils/app_assets.dart';
import 'package:news_project/ui/utils/app_colors.dart';

class CategoryDM {
  String id;
  String title;
  String imagePath;
  Color backgroundColor;
  bool isLeftSided;

  CategoryDM(
      {required this.id,
      required this.title,
      required this.imagePath,
      required this.backgroundColor,
      required this.isLeftSided});

  static List<CategoryDM> categories = [
    CategoryDM(
        id: "sports",
        title: "Sports",
        imagePath: AppAssets.ballImage,
        backgroundColor: AppColors.red,
        isLeftSided: true),
    CategoryDM(
        id: "technology",
        title: "Technology",
        imagePath: AppAssets.politicsImage,
        backgroundColor: AppColors.blue,
        isLeftSided: false),
    CategoryDM(
        id: "health",
        title: "Health",
        imagePath: AppAssets.healthImage,
        backgroundColor: AppColors.purple,
        isLeftSided: true),
    CategoryDM(
        id: "business",
        title: "Business",
        imagePath: AppAssets.businessImage,
        backgroundColor: AppColors.brown,
        isLeftSided: false),
    CategoryDM(
        id: "environment",
        title: "Environment",
        imagePath: AppAssets.envImage,
        backgroundColor: AppColors.lightBlue,
        isLeftSided: true),
    CategoryDM(
        id: "science",
        title: "Science",
        imagePath: AppAssets.scienceImage,
        backgroundColor: AppColors.yellow,
        isLeftSided: false),
  ];
}
