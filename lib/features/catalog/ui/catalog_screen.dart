import 'package:allservice/res/constants/color_constants.dart';
import 'package:allservice/res/constants/font_constants.dart';
import 'package:allservice/features/catalog/data/model/category.dart';
import 'package:allservice/features/catalog/provider/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 32),
        child: Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: AppBar(
            title: Text('Каталог', style: titleTextStyle.copyWith(color: kTitleColor)),
            centerTitle: true,
            backgroundColor: kBackgroundColor,
            iconTheme: const IconThemeData(color: kIconColor),
          ),
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<CategoryProvider>(context, listen: false).fetchCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.error != null) {
            return const Center(child: Text('Произошла ошибка!'));
          } else {
            return Consumer<CategoryProvider>(
              builder: (context, categoryProvider, child) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height - 200,
                        child: GridView.count(
                          crossAxisCount: 3,
                          childAspectRatio: 0.8,
                          padding: const EdgeInsets.all(16.0),
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          children: categoryProvider.categories
                              .map((category) => CategoryItem(category: category))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Category category;

  CategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (category.photo != null)
            category.photo!.endsWith('.svg')
                ? SvgPicture.network(category.photo!, height: 50)
                : Image.network(category.photo!, height: 50)
          else
            const Icon(Icons.image_not_supported, size: 50),
          const SizedBox(height: 8),
          Container(
            height: 40,
            child: Text(
              category.categoryName,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
