import 'package:flutter/material.dart';
import 'package:themovie_flutter/src/resources/color_theme.dart';
import 'package:themovie_flutter/src/feature/account/account_screen.dart';
import 'package:themovie_flutter/src/feature/favorite/favorite_screen.dart';
import 'package:themovie_flutter/src/feature/home/home_screen.dart';
import 'package:themovie_flutter/src/feature/search/search_screen.dart';
import 'package:themovie_flutter/src/widget/app_scaffold.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedScreen = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppScaffold(
        body: listOfScreen[_selectedScreen],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: ColorTheme.primaryDark,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: ColorTheme.primaryDark,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
              backgroundColor: ColorTheme.primaryDark,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Account',
              backgroundColor: ColorTheme.primaryDark,
            ),
          ],
          currentIndex: _selectedScreen,
          selectedItemColor: ColorTheme.light_brown,
          unselectedItemColor: Colors.grey,
          onTap: _onMenuTapped,
        ),
      ),
    );
  }

  List<Widget> get listOfScreen => <Widget>[
        HomeScreen(),
        SearchScreen(),
        FavoriteScreen(),
        AccountScreen(),
      ];

  void _onMenuTapped(int index) {
    setState(() {
      _selectedScreen = index;
    });
  }
}
