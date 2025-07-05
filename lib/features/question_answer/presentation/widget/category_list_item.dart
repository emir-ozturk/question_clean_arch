import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:question_clean_arch/core/extensions/context_extensions.dart';
import 'package:question_clean_arch/features/question_answer/data/models/category_model.dart';
import 'package:question_clean_arch/features/question_answer/presentation/provider/question_provider.dart';
import 'package:question_clean_arch/features/question_answer/presentation/view/question_view.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          context.read<QuestionProvider>().getQuestions(category.id);
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => QuestionView(categoryId: category.id)),
          );
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Icon(Icons.category, size: 40, color: context.colorScheme.primary),
              Text(category.name, style: context.textTheme.titleMedium),
            ],
          ),
        ),
      ),
    );
  }
}
