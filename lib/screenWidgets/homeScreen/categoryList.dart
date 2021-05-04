import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecshop_git/mainScreens/productScreen.dart';
import 'package:tecshop_git/providers/categoryProvider.dart';
import 'package:tecshop_git/screenWidgets/homeScreen/categoryElement.dart';
import 'package:tecshop_git/screenWidgets/homeScreen/titleHeader.dart';
import 'package:tecshop_git/themes/light_color.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context, listen: false);

    return Container(
      margin: EdgeInsets.fromLTRB(12, 15, 12, 0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: LightColors.primaryColor.withOpacity(0.15), width: 1), color: Colors.white),
      child: Column(
        children: [
          TitleHeader(text: 'Categories', borderColor: LightColors.primaryColor, textColor: LightColors.primaryColor),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: categoryProvider.categoryList.length,
            itemBuilder: (context, index) => CategoryElement(
              itemName: categoryProvider.categoryList[index].name,
              imgUrl: categoryProvider.categoryList[index].imageUrl,
              onPress: () {
                categoryProvider.currentCategoryModel = categoryProvider.categoryList[index];
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => ProductScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
