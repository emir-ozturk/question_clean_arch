import 'package:flutter/material.dart';
import 'package:question_clean_arch/features/question_answer/data/models/category_model.dart';
import 'package:question_clean_arch/features/question_answer/presentation/widget/category_list_item.dart';

class CategoryListBuilder extends StatelessWidget {
  const CategoryListBuilder({super.key, required this.categories});
  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),
      itemCount: categories.length,
      itemBuilder: (context, index) => CategoryListItem(category: categories[index]),
    );
  }
}
