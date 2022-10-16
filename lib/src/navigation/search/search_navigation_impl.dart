import 'package:flutter/material.dart';
import 'package:themovie_flutter/src/navigation/search/search_navigation.dart';

import '../route_app.dart';

class SearchNavigationImpl extends SearchNavigation {
  @override
  Future goToSearchSuggestion(BuildContext context, String searchType) async {
    return await Navigator.pushNamed(
      context,
      RouteApp.SEARCH_SUGGESTION,
      arguments: searchType,
    );
  }
}
