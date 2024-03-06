import 'package:flutter/material.dart';
import 'package:news_project/data/model/category_dm.dart';
import 'package:news_project/ui/utils/app_theme.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryDM categoryDM;
  final Radius radius = const Radius.circular(26);

  const CategoryWidget({super.key, required this.categoryDM});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: categoryDM.backgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: radius,
              topRight: radius,
              bottomLeft: categoryDM.isLeftSided ? Radius.zero : radius,
              bottomRight: !categoryDM.isLeftSided ? Radius.zero : radius)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            categoryDM.imagePath,
            height: size.height * .14,
          ),
          const SizedBox(height: 8,),
          Text(
            categoryDM.title,
            style: AppTheme.appBarTextStyle,
          )
        ],
      ),
    );
  }
}
