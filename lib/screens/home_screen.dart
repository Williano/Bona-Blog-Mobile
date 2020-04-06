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
        title: Text(
          "Categories",
          style: TextStyle(
            fontSize: 12.0,
          ),
        )),
    BottomNavigationBarItem(
        icon: FaIcon(
          FontAwesomeIcons.users,
          size: 25.0,
        ),
        title: Text(
          "Authors",
          style: TextStyle(
            fontSize: 12.0,
          ),
        )),
    BottomNavigationBarItem(
        icon: FaIcon(
          Icons.home,
          size: 29.0,
        ),
        title: Text(
          "Feed",
          style: TextStyle(
            fontSize: 12.0,
          ),
        )),
    BottomNavigationBarItem(
        icon: FaIcon(
          Icons.dashboard,
          size: 25.0,
        ),
        title: Text(
          "Dashboard",
          style: TextStyle(
            fontSize: 12.0,
          ),
        )),
    BottomNavigationBarItem(
        icon: FaIcon(
          FontAwesomeIcons.cog,
          size: 26.0,
        ),
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 12.0,
          ),
        ))
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: _appBottomNavigationBar(),
      tabBuilder: (BuildContext context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: CategoryListScreen(),
              );
            });

          case 1:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: UndefinedScreen(),
              );
            });

          case 2:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: FeedScreen(),
              );
            });

          case 3:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: CategoryListScreen(),
              );
            });

          case 4:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: CategoryListScreen(),
              );
            });
        }
      },
    );

    //CustomScaffold(
    //   scaffold: Scaffold(
    //     bottomNavigationBar: _appBottomNavigationBar(),
    //   ),
    //   children: <Widget>[
    //     CategoryListScreen(),
    //     UndefinedScreen(),
    //     FeedScreen(),
    //     FeedScreen(),
    //     FeedScreen(),
    //   ],
    //   onItemTap: (index) {},
    // );
  }

  Widget _appBottomNavigationBar() => CupertinoTabBar(
        currentIndex: _currentTabIndex,
        backgroundColor: customColor,
        activeColor: Colors.black,
        inactiveColor: Colors.white,
        items: _bottomNavigationBarItems,
        onTap: (int index) {
          setState(() {
            _currentTabIndex = index;
          });
        },
      );
}
