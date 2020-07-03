import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poraoo/ui/search/search_page.dart';

import 'ui/global/theme/bloc/theme_bloc.dart';
import 'ui/global/theme/bloc/theme_state.dart';
import 'ui/home/home_page.dart';
import 'package:poraoo/model/pagebucket.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Key homeKey = PageStorageKey('home');
  final Key searchKey = PageStorageKey('search');

  int currentTab = 0;

  HomePage homePage;
  SearchPage searchPage;

  List<Widget> pages;
  Widget currentPage;

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    homePage = HomePage(key: homeKey);

    searchPage = SearchPage(
      key: searchKey,
    );

    pages = [homePage, searchPage];

    currentPage = homePage;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: _buildWithTheme,
      ),
    );
  }

  Widget _buildWithTheme(BuildContext context, ThemeState state) {
    return MaterialApp(
      theme: state.themeData,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Porao"),
        ),
        body: PageStorage(
          child: currentPage,
          bucket: bucket,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentTab,
          iconSize: 20.00,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              currentTab = index;
              currentPage = pages[index];
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text("Search"),
            )
          ],
        ),
      ),
    );
  }
}
