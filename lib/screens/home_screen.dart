import 'package:bona_blog/screens/article_screens/feed_screen/feed_screen.dart';
import 'package:bona_blog/screens/category_screens/category_list_screen/category_list_screen.dart';
import 'package:bona_blog/screens/undefined_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PersistentTabController _controller;
  int _currentTabIndex = 2;

  List<PersistentBottomNavBarItem> _persistentBottomNavigationBarItems(
          BuildContext context) =>
      [
        PersistentBottomNavBarItem(
            icon: FaIcon(
              FontAwesomeIcons.gripVertical,
            ),
            activeColor: Theme.of(context).buttonColor,
            inactiveColor: Theme.of(context).primaryColorLight,
            title: ("Categories")),
        PersistentBottomNavBarItem(
            icon: FaIcon(
              FontAwesomeIcons.users,
            ),
            activeColor: Theme.of(context).buttonColor,
            inactiveColor: Theme.of(context).primaryColorLight,
            title: ("Authors")),
        PersistentBottomNavBarItem(
            icon: FaIcon(
              Icons.home,
              size: 32,
            ),
            activeColor: Theme.of(context).buttonColor,
            inactiveColor: Theme.of(context).primaryColorLight,
            title: ("Feed")),
        PersistentBottomNavBarItem(
            icon: FaIcon(Icons.dashboard, size: 30),
            activeColor: Theme.of(context).buttonColor,
            inactiveColor: Theme.of(context).primaryColorLight,
            title: ("Dashboard")),
        PersistentBottomNavBarItem(
            icon: FaIcon(
              FontAwesomeIcons.cog,
            ),
            activeColor: Theme.of(context).buttonColor,
            inactiveColor: Theme.of(context).primaryColorLight,
            title: ("Settings"))
      ];

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 1);
  }

  List<Widget> _buildScreens() {
    return [
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
  }

  @override
  Widget build(BuildContext context) {
    return _appBottomNavigationBar(context);
  }

  Widget _appBottomNavigationBar(BuildContext context) => PersistentTabView(
        controller: _controller,
        items: _persistentBottomNavigationBarItems(context),
        screens: _buildScreens(),
        backgroundColor: Theme.of(context).bottomAppBarColor,
        showElevation: false,
        iconSize: 26.0,
        navBarCurve: NavBarCurve.none,
        navBarStyle: NavBarStyle.simple,
        onItemSelected: (int index) {
          setState(() {
            _currentTabIndex = index;
          });
        },
      );
}
