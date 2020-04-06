import 'package:bona_blog/screens/category_list_screen.dart';
import 'package:bona_blog/screens/feed_screen.dart';
import 'package:bona_blog/screens/undefined_screen.dart';
import 'package:bona_blog/utilities/custom_material_colors_utils.dart';
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

  List<PersistentBottomNavBarItem> _persistentBottomNavigationBarItems = [
    PersistentBottomNavBarItem(
        icon: FaIcon(
          FontAwesomeIcons.gripVertical,
        ),
        activeColor: Colors.black,
        inactiveColor: Color(0xFFEDF3F3),
        title: ("Categories")),
    PersistentBottomNavBarItem(
        icon: FaIcon(
          FontAwesomeIcons.users,
        ),
        activeColor: Colors.black,
        inactiveColor: Color(0xFFEDF3F3),
        title: ("Authors")),
    PersistentBottomNavBarItem(
        icon: FaIcon(
          Icons.home,
          size: 32,
        ),
        activeColor: Colors.black,
        inactiveColor: Color(0xFFEDF3F3),
        title: ("Feed")),
    PersistentBottomNavBarItem(
        icon: FaIcon(Icons.dashboard, size: 30),
        activeColor: Colors.black,
        inactiveColor: Color(0xFFEDF3F3),
        title: ("Dashboard")),
    PersistentBottomNavBarItem(
        icon: FaIcon(
          FontAwesomeIcons.cog,
        ),
        activeColor: Colors.black,
        inactiveColor: Color(0xFFEDF3F3),
        title: ("Settings"))
  ];

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 2);
  }

  List<Widget> _buildScreens() {
    return [
      CategoryListScreen(),
      UndefinedScreen(),
      FeedScreen(),
      FeedScreen(),
      FeedScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return _appBottomNavigationBar();
  }

  Widget _appBottomNavigationBar() => PersistentTabView(
        controller: _controller,
        items: _persistentBottomNavigationBarItems,
        screens: _buildScreens(),
        backgroundColor: customColor,
        showElevation: false,
        selectedIndex: _currentTabIndex,
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
