import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_project/data/model/category_dm.dart';
import 'package:news_project/ui/utils/app_colors.dart';
import 'package:news_project/ui/utils/app_theme.dart';
import 'package:news_project/ui/widgets/category_widget.dart';

class CategoriesTab extends StatelessWidget {
  final Function onCategoryClick;
  const CategoriesTab({super.key, required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 34, left: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Pick your category", style:
                    AppTheme.appBarTextStyle.copyWith(color: AppColors.accent),),
              Text("of interest", style:
                    AppTheme.appBarTextStyle.copyWith(color: AppColors.accent),),
            ],
          ),
        ),
        // const SizedBox(height: 28,),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 28),
            child: GridView.builder(
                itemCount: CategoryDM.categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 30,
                    childAspectRatio: .9),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      onCategoryClick(CategoryDM.categories[index]);
                    },
                    child: CategoryWidget(
                        categoryDM: CategoryDM.categories[index]),
                  );
                }),
          ),
        )
      ],
    );
  }
}
