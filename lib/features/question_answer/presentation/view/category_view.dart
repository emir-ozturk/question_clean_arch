import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:question_clean_arch/core/widget/app_error.dart';
import 'package:question_clean_arch/core/widget/app_loading.dart';
import 'package:question_clean_arch/features/question_answer/presentation/provider/question_provider.dart';
import 'package:question_clean_arch/features/question_answer/presentation/widget/category_list_builder.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  void initState() {
    super.initState();
    // Widget mount edildikten sonra kategorileri çek
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<QuestionProvider>(context, listen: false);
      provider.getCategories(context.locale.languageCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('questions.title'.tr())),
      body: Consumer<QuestionProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) return const AppLoading();
          if (provider.errorMessage != null) return AppError(errorMessage: provider.errorMessage!);

          return CategoryListBuilder(categories: provider.categories);
        },
      ),
    );
  }
}
