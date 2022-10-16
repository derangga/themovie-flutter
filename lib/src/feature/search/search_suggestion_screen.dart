import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/feature/search/search_bloc.dart';
import 'package:themovie_flutter/src/utils/debouncer.dart';
import 'package:themovie_flutter/src/widget/app_scaffold.dart';
import 'package:themovie_flutter/src/widget/dark_app_bar.dart';
import 'package:themovie_flutter/src/widget/text/text_view.dart';
import '../../core/base/base_cubit_widget.dart';
import '../../resources/color_theme.dart';
import '../../resources/fonts.dart';
import '../../widget/container/rounded_container_view.dart';
import 'search_suggestion_bloc.dart';
import 'search_suggestion_state.dart';

class SearchSuggestionScreen extends StatefulWidget {
  final String searchType;
  const SearchSuggestionScreen(
    this.searchType, {
    Key? key,
  }) : super(key: key);

  @override
  State<SearchSuggestionScreen> createState() => _SearchSuggestionScreenState();
}

class _SearchSuggestionScreenState extends BaseCubitWidget<SearchSuggestionBloc,
    SearchSuggestionState, SearchSuggestionScreen> {
  final _debounce = Debouncer(milliseconds: 800);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => bloc),
      child: AppScaffold(
        appBar: DarkAppBar(
          leading: Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: ShapeDecoration(
                shape: CircleBorder(), color: ColorTheme.primaryDark),
            child: IconButton(
                icon: Icon(Icons.arrow_back_ios_rounded),
                onPressed: () => Navigator.pop(context)),
          ),
          title: RoundedContainerView(
            borderRadius: BorderRadius.circular(8.0),
            backgroundColor: Colors.white,
            height: 36.0,
            child: Center(
              child: TextField(
                autofocus: true,
                style: TextStyle(
                  color: ColorTheme.primary,
                  fontFamily: Fonts.SF_UI_TEXT,
                  fontSize: 14,
                ),
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: ColorTheme.primary,
                    size: 16,
                  ),
                  suffixIcon: GestureDetector(
                    child: Icon(
                      Icons.clear,
                      color: ColorTheme.primary,
                      size: 16,
                    ),
                    onTap: () {
                      /* Clear the search field */
                    },
                  ),
                  hintText: 'Find your favorite movie',
                  hintStyle: TextStyle(color: ColorTheme.primaryDark),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  _debounce.run(() {
                    final searchType = widget.searchType.toUpperCase();
                    if (value.isNotEmpty) {
                      if (searchType == SearchType.MOVIE.name) {
                        bloc.fetchSuggestionSearchMovie(value);
                      } else {
                        bloc.fetchSuggestionSearchTvShow(value);
                      }
                    } else {
                      bloc.clearSearch();
                    }
                  });
                },
                onSubmitted: (value) {
                  Navigator.of(context).pop(value);
                },
              ),
            ),
          ),
        ),
        body: BlocBuilder<SearchSuggestionBloc, SearchSuggestionState>(
          builder: ((context, state) => mapStateHandler(state)),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _debounce.cancel();
    super.dispose();
  }

  @override
  Widget mapStateHandler(SearchSuggestionState state) {
    if (state.suggestSearchName.isNotEmpty) {
      return ListView.builder(
          itemCount: state.suggestSearchName.length,
          itemBuilder: ((context, position) {
            final suggestionName = state.suggestSearchName[position];
            return suggestionItem(suggestionName);
          }));
    } else {
      return Container();
    }
  }

  Widget suggestionItem(String suggestionName) {
    return ListTile(
      title: TextView(suggestionName),
      trailing: Icon(
        Icons.north_west,
      ),
      onTap: () {
        Navigator.of(context).pop(suggestionName);
      },
    );
  }
}
