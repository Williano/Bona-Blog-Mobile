import 'package:bona_blog/features/article/ui/feed_screen/feed_screen.dart';
import 'package:bona_blog/features/category/ui/category_list_screen/category_list_screen.dart';
import 'package:bona_blog/features/undefined_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key key}) : super(key: key);

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentTabIndex = 2;

  List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    BottomNavigationBarItem(
      icon: FaIcon(
        FontAwesomeIcons.gripVertical,
      ),
      title: Text("Categories"),
    ),
    BottomNavigationBarItem(
      icon: FaIcon(
        FontAwesomeIcons.users,
      ),
      title: Text("Authors"),
    ),
    BottomNavigationBarItem(
      icon: FaIcon(
        Icons.home,
        size: 32,
      ),
      title: Text("Feed"),
    ),
    BottomNavigationBarItem(
      icon: FaIcon(Icons.dashboard, size: 30),
      title: Text("Dashboard"),
    ),
    BottomNavigationBarItem(
      icon: FaIcon(
        FontAwesomeIcons.cog,
      ),
      title: Text("Settings"),
    ),
  ];

  List<Widget> _screens = [
    CategoryListScreen(
      key: PageStorageKey("List"),
    ),
    UndefinedScreen(
      key: PageStorageKey("Undefined"),
    ),
    FeedScreen(key: PageStorageKey("Feed1")),
    FeedScreen(key: PageStorageKey("Feed2")),
    FeedScreen(key: PageStorageKey("Feed3")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentTabIndex,
        items: _bottomNavigationBarItems,
        backgroundColor: Theme.of(context).bottomAppBarColor,
        iconSize: 26.0,
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).buttonColor,
        unselectedItemColor: Theme.of(context).primaryColorLight,
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }
}
