import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:question_clean_arch/features/question_answer/data/models/category_model.dart';
import 'package:question_clean_arch/features/question_answer/presentation/provider/question_provider.dart';

class CategoryListBuilder extends StatelessWidget {
  const CategoryListBuilder({super.key, required this.categories});
  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];

        return ListTile(
          title: Text(category.name),
          onTap: () async {
            await context.read<QuestionProvider>().getQuestions(category.id);
          },
        );
      },
    );
  }
}
