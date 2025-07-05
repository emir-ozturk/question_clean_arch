import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  const AppError({super.key, required this.errorMessage});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: Theme.of(context).textTheme.bodyMedium,
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
