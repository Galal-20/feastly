import 'package:feastly/src/core/constants/strings.dart';
import 'package:flutter/material.dart';

AppBar buildCustomAiAppBar(BuildContext context) {
  return AppBar(
    title: Text(
      AppStrings.aiAppBarTitle,
      style: Theme.of(context).textTheme.displayLarge,
    ),
    backgroundColor: Colors.transparent,
  );
}
