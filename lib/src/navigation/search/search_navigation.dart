import 'package:flutter/material.dart';

abstract class SearchNavigation {
  Future<dynamic> goToSearchSuggestion(
    BuildContext context,
    String searchType,
  );
}
