import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:question_clean_arch/core/extensions/context_extensions.dart';
import 'package:question_clean_arch/core/widget/app_error.dart';
import 'package:question_clean_arch/core/widget/app_loading.dart';
import 'package:question_clean_arch/features/question_answer/presentation/provider/question_provider.dart';

class QuestionView extends StatelessWidget {
  const QuestionView({super.key, required this.categoryId});
  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('questions.title').tr()),
      body: Consumer<QuestionProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) return const AppLoading();
          if (provider.errorMessage != null) {
            return AppError(
              errorMessage: provider.errorMessage!,
              onPressed: () async {
                await provider.getQuestions(categoryId);
              },
            );
          }

          return ListView.builder(
            itemCount: provider.questions.length,
            itemBuilder: (context, index) => Card(
              child: ExpansionTile(
                leading: Icon(Icons.question_answer, size: 30, color: context.colorScheme.primary),
                trailing: Icon(Icons.arrow_drop_down, size: 30, color: context.colorScheme.primary),
                title: Text(
                  provider.questions[index].question,
                  style: context.textTheme.titleMedium,
                ),
                tilePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                children: [
                  Text(provider.questions[index].answer, style: context.textTheme.bodyMedium),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
