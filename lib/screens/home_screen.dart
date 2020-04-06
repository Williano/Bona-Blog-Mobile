import 'package:bona_blog/screens/category_list_screen.dart';
import 'package:bona_blog/screens/feed_screen.dart';
import 'package:bona_blog/screens/undefined_screen.dart';
import 'package:bona_blog/utilities/custom_material_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTabIndex = 2;

  List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    BottomNavigationBarItem(
        icon: FaIcon(
          FontAwesomeIcons.gripVertical,
          size: 25.0,
        ),
        title: Text("Categories")),
    BottomNavigationBarItem(
        icon: FaIcon(
          FontAwesomeIcons.users,
          size: 25.0,
        ),
        title: Text("Authors")),
    BottomNavigationBarItem(
        icon: FaIcon(
          Icons.home,
          size: 25.0,
        ),
        title: Text("Feed")),
    BottomNavigationBarItem(
        icon: FaIcon(
          Icons.dashboard,
          size: 25.0,
        ),
        title: Text("Dashboard")),
    BottomNavigationBarItem(
        icon: FaIcon(
          FontAwesomeIcons.cog,
          size: 26.0,
        ),
        title: Text("Settings"))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentTabIndex,
        children: <Widget>[
          CategoryListScreen(),
          UndefinedScreen(),
          FeedScreen(),
          FeedScreen(),
          FeedScreen(),
        ],
      ),
      bottomNavigationBar: _appBottomNavigationBar(),
    );
  }

  Widget _appBottomNavigationBar() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0.0,
        backgroundColor: customColor,
        selectedItemColor: Theme.of(context).primaryColorDark,
        unselectedItemColor: Theme.of(context).backgroundColor,
        currentIndex: _currentTabIndex,
        items: _bottomNavigationBarItems,
        onTap: (int index) {
          setState(() {
            _currentTabIndex = index;
          });
        },
      );
}
