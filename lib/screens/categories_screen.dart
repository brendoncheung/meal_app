import "package:flutter/material.dart";
import 'package:meal_app/widgets/category_item.dart';
import "package:meal_app/model/dummy_data.dart";

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Categories screen context: ${context.hashCode}');
    return GridView(
      padding: const EdgeInsets.all(25),
      children: <Widget>[
        ...DUMMY_CATEGORIES.map(
          (data) {
            return CategoryItem(
              id: data.id,
              title: data.title,
              color: data.color,
            );
          },
        ).toList()
      ],
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
