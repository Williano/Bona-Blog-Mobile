import 'package:bona_blog/screens/feed_screen.dart';
import 'package:bona_blog/utilities/custom_material_color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTabIndex = 2;

  final PageStorageBucket bucket = PageStorageBucket();

  List<Widget> screens = [
    FeedScreen(key: PageStorageKey("Feed Screen")),
    FeedScreen(key: PageStorageKey("Feed Screen")),
    FeedScreen(key: PageStorageKey("Feed Screen")),
    FeedScreen(key: PageStorageKey("Feed Screen")),
    FeedScreen(key: PageStorageKey("Feed Screen")),
  ];

  List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.apps), title: Text("Categories")),
    BottomNavigationBarItem(icon: Icon(Icons.people), title: Text("Authors")),
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Feed")),
    BottomNavigationBarItem(
        icon: Icon(Icons.dashboard), title: Text("Dashboard")),
    BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("Settings"))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: screens[_currentTabIndex],
      ),
      bottomNavigationBar: _appBottomNavigationBar(),
    );
  }

  Widget _appBottomNavigationBar() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: customColor,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        currentIndex: _currentTabIndex,
        items: _bottomNavigationBarItems,
        onTap: (int index) {
          setState(() {
            _currentTabIndex = index;
          });
        },
      );
}
