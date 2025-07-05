import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  const AppError({super.key, required this.errorMessage, required this.onPressed});
  final String errorMessage;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.error, size: 40, color: Colors.red),
          SelectableText(
            errorMessage.tr(),
            style: Theme.of(context).textTheme.bodyLarge,
            maxLines: 5,
          ),
          ElevatedButton(onPressed: onPressed, child: Text('Try Again'.tr())),
        ],
      ),
    );
  }
}
